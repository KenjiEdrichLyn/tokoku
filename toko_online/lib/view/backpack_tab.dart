import 'package:flutter/material.dart';
import 'package:toko_online/model/item_model.dart';
import 'package:toko_online/view/backpack_detail_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toko_online/resources/project_colors.dart';

Widget backpackTab(List<ProductItem> datalist){

  Widget getDiscountWidget(int discount, int index){
    if(discount!=0){
      return Row(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: Text(datalist[index].discount.toString()+"%", style: TextStyle(fontSize: 15))
            ),
            Expanded(child: Container()), // biar icon ke kanan
            LikeButtonWidget(id: datalist[index].id)
          ]
      );
    }else{
      return Row(
          children: <Widget>[
            Expanded(child: Container()), // biar icon ke kanan
            LikeButtonWidget(id: datalist[index].id)
          ]
      );
    }
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1/1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemCount: datalist.length,
        itemBuilder: (BuildContext context, index){
          if(datalist[index].type == "Backpack") {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BackpackDetailScreen(object: datalist[index])
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: grey, width:1)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getDiscountWidget(datalist[index].discount, index),
                    Expanded(
                      child: Image.asset(datalist[index].photoAsset, fit: BoxFit.contain),
                    ),
                    Center(
                      child: Text(
                          datalist[index].name,
                          style: TextStyle(fontSize: 15, color: purple)
                      ),
                    ),
                    Center(
                      child: Text(
                          "\$"+datalist[index].price.toString(),
                          style: TextStyle(fontFamily: "NunitoBold", fontSize: 18, color: purple)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0, bottom: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RatingBar.builder(
                            itemSize: 10,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            minRating: 1,
                            initialRating: datalist[index].rating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            onRatingUpdate: (double value) { return null; },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(datalist[index].rating.toString(), style: TextStyle(fontSize: 10)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }return null;
        }
    ),
  );
}

class LikeButtonWidget extends StatefulWidget{
  final int id;
  LikeButtonWidget({this.id});

  @override
  State<StatefulWidget> createState()=>_ChangeIconImage();
}

class _ChangeIconImage extends State<LikeButtonWidget>{
  Color _iconColor;
  int index;

  getIndex(){
    for(int i=0;i<backpackList.length;i++){
      if(backpackList[i].id == widget.id){
        this.index = i;
      }
    }
  }

  setColor(){
    if(backpackList[index].isLiked){
      _iconColor = Colors.red;
    }else{
      _iconColor = Colors.black26;
    }
  }

  @override
  Widget build(BuildContext context) {
    this.getIndex();
    this.setColor();
    return IconButton(
      icon: Image.asset("images/heart.png", color: _iconColor, height: 15),
      onPressed: () {
        setState(() {
          if(_iconColor == Colors.red){
            _iconColor = Colors.black26;
            backpackList[index].isLiked = false;
          }else{
            _iconColor = Colors.red;
            backpackList[index].isLiked = true;
          }
        });
      },
    );
  }

}