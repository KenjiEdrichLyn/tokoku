import 'dart:ui';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:toko_online/model/item_model.dart';
import 'package:toko_online/model/cart_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toko_online/resources/project_colors.dart';

class BackpackDetailScreen extends StatelessWidget{
  final ProductItem object;
  BackpackDetailScreen({this.object});

  Widget getLikeIcon(bool isliked){
    if(isliked){
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Image.asset("images/heart.png", color: red, height: 15, width: 15,),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Image.asset("images/heart.png", color: grey, height: 15, width: 15,),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back, color: black), onPressed: () { Navigator.pop(context); }),
            centerTitle: true,
            backgroundColor: transparent,
            elevation: 0,
            title: Container(
                margin: EdgeInsets.only(top:5),
                child: Image.asset('images/xe_logo_transparent.png', fit: BoxFit.contain, height: 160, width: 160,)
            ),
            actions: <Widget>[
              getLikeIcon(object.isLiked)
            ]
        ),
        body: SingleChildScrollView(child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(color: Colors.cyan[100], borderRadius: BorderRadius.circular(10)),
                          child: Text(object.discount.toString()+"%")
                      )
                  )
              ),
              Image.asset(object.photoAsset, fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Row(
                  children: <Widget>[
                    Text(
                        object.name,
                        style: TextStyle(fontFamily: "NunitoBold", fontSize: 25, color: purple)
                    ),
                    Expanded(child: Container()),
                    RatingBar.builder(
                      itemSize: 16,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      initialRating: 1,
                      itemCount: 1,
                      onRatingUpdate: (double value) { return null; },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:8.0, left: 4.0),
                      child: Text("("+object.rating.toString()+")"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                    object.detail,
                    style: TextStyle(fontSize: 15, color: purple)
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30),
                  child: RadioForm(object: this.object)
              )
            ]
        ),)
    ));
  }
}

class RadioForm extends StatefulWidget{
  final ProductItem object;
  RadioForm({ this.object });

  double getDiscounted(ProductItem item){
    return item.price-(item.price*item.discount/100);
  }

  @override
  State<StatefulWidget> createState() {
    return _FormState(object.color[0], object.price, getDiscounted(object));
  }
}

class _FormState extends State<RadioForm>{
  Color _color;
  double _total;
  _FormState(this._color, this._total, this._afterDiscount);

  double _afterDiscount;
  String _size="US 6";
  int _qty=1;

  Color getColorPick(Color color){
    if(_color != color){
      return transparent;
    }else{
      return Colors.cyan[100];
    }
  }

  Widget getDiscountWidget(){
    if(widget.object.discount == 0){
      return Text(
        "\$"+_total.toString(),
        style: TextStyle(fontSize: 28, fontFamily: "NunitoBold", color:black),
      );
    }else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(text: "\$"+_total.toString(), style: TextStyle(decoration: TextDecoration.lineThrough, color: black, fontSize: 22, fontFamily: "NunitoBold")),
          ),
          Text(
            "\$"+_afterDiscount.toString(),
            style: TextStyle(fontSize: 17, fontFamily: "NunitoBold", color:black),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        CustomRadioButton(
          elevation: 0,
          selectedColor: Colors.cyan[100],
          unSelectedColor: transparent,
          buttonLables: ["Small","Medium","Large"],
          buttonValues: ["Small","Medium","Large"],
          radioButtonValue: (value){
            _size = value;
          },
          enableShape: false,
          unSelectedBorderColor: transparent,
          selectedBorderColor: transparent,
          buttonTextStyle: ButtonTextStyle(
              selectedColor: black,
              unSelectedColor: black,
              textStyle: TextStyle(fontSize: 15, fontFamily: "NunitoBold")
          ),
          absoluteZeroSpacing: true,
          defaultSelected: "Small",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text("Available Colors:", style: TextStyle(fontSize: 15)),
              Container(
                height: 50,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    final List<Color> color = widget.object.color;
                    return Container(
                      margin: EdgeInsets.only(left:6),
                      child: Material(
                          color: getColorPick(color[index]),
                          borderRadius: BorderRadius.circular(80),
                          child: InkResponse(
                            splashColor: transparent,
                            child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: color[index]),
                              height: 25,
                              width: 25,
                              margin: EdgeInsets.only(left:10, right: 10),
                            ),
                            onTap: (){
                              setState(() {
                                _color=color[index];
                              });
                            },
                          )
                      ),
                    );
                  },
                  itemCount: widget.object.color.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Text("Quantity:"),
              IconButton(icon:Icon(Icons.keyboard_arrow_up) , onPressed: (){
                setState(() {
                  if(_qty<=9){
                    _qty++;
                    _total+=widget.object.price;
                    _afterDiscount = _total - (_total*widget.object.discount/100);
                  }
                });
              },splashRadius: 15, color: purple),
              Container(
                padding: EdgeInsets.only(right: 10,left: 10),
                child: Text(_qty.toString()),
                decoration: BoxDecoration(
                  border: Border.all(color: purple, width: 2.0,),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              IconButton(icon:Icon(Icons.keyboard_arrow_down) , onPressed: (){
                setState(() {
                  if(_qty>1){
                    _qty--;
                    _total-=widget.object.price;
                    _afterDiscount = _total - (_total*widget.object.discount/100);
                  }
                });
              },splashRadius: 15, color: purple),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top:30, bottom:15, right: 10),
            child: Row(
              children: <Widget>[
                getDiscountWidget(),
                Expanded(child: Container()),
                ElevatedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Text("Add to cart")
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: transparent,
                      onPrimary: purple,
                      elevation: 0
                  ),
                  onPressed: (){
                    cartList.add(
                        CartItem(
                            name: widget.object.name,
                            total: widget.object.price * _qty,
                            imageAsset: widget.object.photoAsset,
                            size: _size,
                            color: _color,
                            discount: widget.object.discount
                        )
                    );
                    Navigator.popAndPushNamed(context, '/cart');
                  },
                )
              ],
            )
        )
      ],
    );
  }
}