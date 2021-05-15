import 'package:flutter/material.dart';
import 'package:toko_online/model/cart_model.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget _widgetBody(){
      if(cartList.length==0){
        return Center(
            child: Text("NO DATA",style: TextStyle(fontSize: 20))
        );
      }else{
        return ListView.builder(
            itemBuilder: (BuildContext context, int index){
              return Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 6),
                height: 150,
                child: Card(
                  child: Row(children: <Widget>[
                    Image.asset(cartList[index].imageAsset, fit: BoxFit.scaleDown),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(cartList[index].name, style: TextStyle(fontSize: 18, fontFamily: "NunitoBold", color: Colors.deepPurpleAccent[400])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 4),
                        child: Text("Size: "+cartList[index].size, style: TextStyle(fontSize: 14, fontFamily: "NunitoRegular", color: Colors.black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 4),
                        child: Text("Total: \$"+cartList[index].total.toString(), style: TextStyle(fontSize: 14, fontFamily: "NunitoRegular", color: Colors.black)),
                      ),
                    ]))

                  ]),
                ),
              );
            },
            itemCount: cartList.length,
        );
      }
    };

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              margin: EdgeInsets.only(top:5),
              child: Image.asset('images/xe_logo_transparent.png', fit: BoxFit.contain, height: 160, width: 160,)
          ),
      ),
      body: _widgetBody(),
    );
  }

}