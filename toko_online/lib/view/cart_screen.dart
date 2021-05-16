import 'package:flutter/material.dart';
import 'package:toko_online/model/cart_model.dart';
import 'package:toko_online/resources/project_colors.dart';

class CartScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget getTotalWidget(int index){
      if(cartList[index].discount == 0){
        return Text("Total : "+cartList[index].total.toString(), style: TextStyle(fontFamily: "NunitoRegular", fontSize: 15));
      }else{
        double totalAfter = cartList[index].total-(cartList[index].total*cartList[index].discount/100);
        return RichText(
          text: TextSpan(
            text: 'Total :  ',
            style: TextStyle(color: black, fontSize: 15, fontFamily: "NunitoRegular"),
            children: <TextSpan>[
              TextSpan(text: "\$"+cartList[index].total.toString(), style: TextStyle(decoration: TextDecoration.lineThrough)),
              TextSpan(text: "   \$"+totalAfter.toString()),
            ],
          ),
        );
      }
    }

    Widget _widgetBody(){
      if(cartList.length==0)
        return Center(
            child: Text("NO DATA",style: TextStyle(fontSize: 20))
        );
      else
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
                        child: Text(cartList[index].name, style: TextStyle(fontSize: 18, fontFamily: "NunitoBold", color: purple)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 4),
                        child: Text("Size: "+cartList[index].size, style: TextStyle(fontSize: 14, fontFamily: "NunitoRegular", color: black)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 4),
                        child: getTotalWidget(index)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 4),
                        child: Row(children: [
                          Text("Color: ",style: TextStyle(fontSize: 14, fontFamily: "NunitoRegular", color: black)),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(shape: BoxShape.circle,color: cartList[index].color),
                          )
                        ])
                      ),
                    ]))
                  ]),
                ),
              );
            },
            itemCount: cartList.length,
        );
      }


    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.home, color: black),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          backgroundColor: transparent,
          elevation: 0,
          title: Container(
              margin: EdgeInsets.only(top:5),
              child: Image.asset('images/xe_logo_transparent.png', fit: BoxFit.contain, height: 160, width: 160,)
          ),
      ),
      body: _widgetBody()
    );
  }

}