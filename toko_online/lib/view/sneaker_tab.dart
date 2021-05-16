import 'package:flutter/material.dart';
import 'package:toko_online/model/item_model.dart';
import 'package:toko_online/view/detail_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:toko_online/resources/project_colors.dart';

class SneakerTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1/1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
          ),
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, index){
            if(itemList[index].type == "Sneakers") {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailScreen(itemIndex: index)
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
                      Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.cyan[100],
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: Text(itemList[index].discount.toString()+"%", style: TextStyle(fontSize: 15))
                          ),
                          Expanded(child: Container()), // biar icon ke kanan
                          LikeButtonWidget(index: index)
                        ]
                      ),
                      Expanded(
                        child: Image.asset(itemList[index].photoAsset, fit: BoxFit.contain),
                      ),
                      Center(
                        child: Text(
                            itemList[index].name,
                            style: TextStyle(fontSize: 15, color: purple)
                        ),
                      ),
                      Center(
                        child: Text(
                            "\$"+itemList[index].price.toString(),
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
                              initialRating: itemList[index].rating,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              onRatingUpdate: (double value) { return null; },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(itemList[index].rating.toString(), style: TextStyle(fontSize: 10)),
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
}

class LikeButtonWidget extends StatefulWidget{

  final int index;
  LikeButtonWidget({this.index});

  @override
  State<StatefulWidget> createState()=>_ChangeIconImage();
}

class _ChangeIconImage extends State<LikeButtonWidget>{
  Color _iconColor;

  setColor(){
    if(itemList[widget.index].isLiked){
      _iconColor = Colors.red;
    }else{
      _iconColor = Colors.black26;
    }
  }

  @override
  Widget build(BuildContext context) {
    this.setColor();
    return IconButton(
      icon: Image.asset("images/heart.png", color: _iconColor, height: 15),
      onPressed: () {
        setState(() {
          if(_iconColor == Colors.red){
            _iconColor = Colors.black26;
            itemList[widget.index].isLiked = false;
          }else{
            _iconColor = Colors.red;
            itemList[widget.index].isLiked = true;
          }
        });
      },
    );
  }

}