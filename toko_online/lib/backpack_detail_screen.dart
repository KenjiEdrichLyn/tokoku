import 'dart:ui';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:toko_online/backpack_tab.dart';
import 'package:toko_online/model/item_model.dart';
import 'package:toko_online/model/cart_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BackpackDetailScreen extends StatelessWidget{
  final int itemIndex;
  BackpackDetailScreen({this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () { Navigator.pop(context); }),
            centerTitle: true,
            backgroundColor: Colors.transparent,
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
                          child: Text(backpackList[itemIndex].discount)
                      )
                  )
              ),
              Image.asset(backpackList[itemIndex].photoAsset, fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Row(
                  children: <Widget>[
                    Text(
                        backpackList[itemIndex].name,
                        style: TextStyle(fontFamily: "NunitoBold", fontSize: 25, color: Colors.deepPurpleAccent[400])
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
                      child: Text("("+backpackList[itemIndex].rating.toString()+")"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                    backpackList[itemIndex].detail,
                    style: TextStyle(fontSize: 15, color: Colors.deepPurpleAccent[400])
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
    return _FormState();
  }
}

class _FormState extends State<RadioForm>{
  String _size="Small";
  int _qty=1;

  @override
  Widget build(BuildContext context){
    return Form(
        child: Column(
          children: [
            CustomRadioButton(
              elevation: 0,
              selectedColor: Colors.cyan[100],
              unSelectedColor: Colors.transparent,
              buttonLables: ["Small","Medium","Big"],
              buttonValues: ["Small","Medium","Big"],
              radioButtonValue: (value){
                _size = value;
              },
              enableShape: false,
              unSelectedBorderColor: Colors.transparent,
              selectedBorderColor: Colors.transparent,
              buttonTextStyle: ButtonTextStyle(
                  selectedColor: Colors.black,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(fontSize: 15, fontFamily: "NunitoBold")
              ),
              absoluteZeroSpacing: true,
              defaultSelected: "Small",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text("Available Colors:", style: TextStyle(fontSize: 10)),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index){
                        final List<Color> color = backpackList[widget.index].color;
                        return Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, color: color[index]),
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(left:30),
                        );
                      },
                      itemCount: backpackList[widget.index].color.length,
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
                      }
                    });
                  },splashRadius: 15, color: Colors.deepPurpleAccent[400]),
                  Container(
                    padding: EdgeInsets.only(right: 10,left: 10),
                    child: Text(_qty.toString()),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurpleAccent[400], width: 2.0,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  IconButton(icon:Icon(Icons.keyboard_arrow_down) , onPressed: (){
                    setState(() {
                      if(_qty>1){
                        _qty--;
                      }
                    });
                  },splashRadius: 15, color: Colors.deepPurpleAccent[400]),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top:30, bottom:15, right: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "\$"+backpackList[widget.index].price.toString(),
                      style: TextStyle(fontSize: 28, fontFamily: "NunitoBold", color:Colors.black),
                    ),
                    Text(
                      " / piece",
                      style: TextStyle(fontSize: 15, fontFamily: "NunitoBold", color:Colors.deepPurpleAccent[400]),
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
                          primary: Colors.transparent,
                          onPrimary: Colors.deepPurpleAccent[400],
                          elevation: 0
                      ),
                      onPressed: () async{
                        await cartList.add(
                            CartItem(
                                name: backpackList[widget.index].name,
                                total: backpackList[widget.index].price * _qty,
                                imageAsset: backpackList[widget.index].photoAsset,
                                size: _size
                            )
                        );
                        Navigator.popAndPushNamed(context, '/cart');
                      },
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}