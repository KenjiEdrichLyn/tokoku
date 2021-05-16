import 'dart:ui';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:toko_online/view/watch_tab.dart';
import 'package:toko_online/model/item_model.dart';
import 'package:toko_online/model/cart_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toko_online/resources/project_colors.dart';

class WatchDetailScreen extends StatelessWidget{
  final int itemIndex;
  WatchDetailScreen({this.itemIndex});

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
              LikeButtonWidget(index: itemIndex)
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
                          child: Text(watchList[itemIndex].discount.toString()+"%")
                      )
                  )
              ),
              Image.asset(watchList[itemIndex].photoAsset, fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Row(
                  children: <Widget>[
                    Text(
                        watchList[itemIndex].name,
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
                      child: Text("("+watchList[itemIndex].rating.toString()+")"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                    watchList[itemIndex].detail,
                    style: TextStyle(fontSize: 15, color: purple)
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30),
                  child: RadioForm(index: itemIndex)
              )
            ]
        ),)
    ));
  }
}

class RadioForm extends StatefulWidget{
  final int index;
  RadioForm({this.index});

  @override
  State<StatefulWidget> createState() {
    return _FormState(watchList[index].color[0], watchList[index].price);
  }
}

class _FormState extends State<RadioForm>{
  Color _color;
  double _total;
  _FormState(this._color, this._total);

  String _size="S";
  int _qty=1;

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        CustomRadioButton(
          elevation: 0,
          selectedColor: Colors.cyan[100],
          unSelectedColor: Colors.transparent,
          buttonLables: ["S","M","L","XL"],
          buttonValues: ["S","M","L","XL"],
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
          defaultSelected: "S",
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
                    final List<Color> color = watchList[widget.index].color;
                    return InkWell(
                      splashColor: color[index],
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: color[index]),
                        height: 25,
                        width: 25,
                        margin: EdgeInsets.only(left:15, right: 15),
                      ),
                      onTap: (){
                        setState(() {
                          _color=color[index];
                        });
                      },
                    );
                  },
                  itemCount: watchList[widget.index].color.length,
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
                    _total+=watchList[widget.index].price;
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
                    _total-=watchList[widget.index].price;
                  }
                });
              },splashRadius: 15, color: purple),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Text("Color Picked:", style: TextStyle(fontSize: 15)),
                Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.only(left:30),
                )
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(top:30, bottom:15, right: 10),
            child: Row(
              children: <Widget>[
                Text(
                  "\$"+_total.toString(),
                  style: TextStyle(fontSize: 28, fontFamily: "NunitoBold", color:black),
                ),
                Text(
                  " : total",
                  style: TextStyle(fontSize: 15, fontFamily: "NunitoBold", color:purple),
                ),
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
                            name: watchList[widget.index].name,
                            total: watchList[widget.index].price * _qty,
                            imageAsset: watchList[widget.index].photoAsset,
                            size: _size,
                            color: _color,
                            discount: itemList[widget.index].discount
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