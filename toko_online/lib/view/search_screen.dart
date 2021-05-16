import 'package:flutter/material.dart';
import 'package:toko_online/model/item_model.dart';
import 'package:toko_online/resources/project_colors.dart';

class SearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }

}

class _SearchState extends State<SearchScreen>{
  List<ProductItem> _hint=[];
  String _search="";

  List<ProductItem> getHint (){
    List<ProductItem> hintList=[];

    var sneakerLength=itemList.length;
    var watchLength=watchList.length;
    var bagLength=backpackList.length;

    if(_search.toLowerCase() == "sneaker" || _search.toLowerCase() == "sneakers"){
      hintList.addAll(itemList);
    }else if(_search.toLowerCase() == "watch"){
      hintList.addAll(watchList);
    }else if(_search.toLowerCase() == "backpack"){
      hintList.addAll(backpackList);
    }else{
      for( var i = 0 ; i < sneakerLength; i++ ) {
        if(itemList[i].name.toLowerCase().contains(_search.toLowerCase()) && _search!=""){
          hintList.add(itemList[i]);
        }
      }
      for( var i = 0 ; i < watchLength; i++ ) {
        if(watchList[i].name.toLowerCase().contains(_search.toLowerCase()) && _search!=""){
          hintList.add(watchList[i]);
        }
      }
      for( var i = 0 ; i < bagLength; i++ ) {
        if(backpackList[i].name.toLowerCase().contains(_search.toLowerCase()) && _search!=""){
          hintList.add(backpackList[i]);
        }
      }
    }

    return hintList;
  }

  var msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close_outlined, color: black),
            onPressed: () {
              setState(() {
                if(_search==""){
                  Navigator.pop(context);
                }else{
                  _search="";
                  msgController.text="";
                }
              });
            }),
          centerTitle: true,
          backgroundColor: transparent,
          elevation: 0,
          title: TextField(
            controller: msgController,
            onChanged: (String value){
              setState(() {
                _search=value;
                _hint=getHint();
              });
            },
            decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search Item name'
            ),
          )
      ),
      body: ListView.builder(
          itemCount: _hint.length,
          itemBuilder: (BuildContext context, index){
            return Container(
              margin: const EdgeInsets.only(right: 8, left: 8, bottom: 3),
              height: 100,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(_hint[index].photoAsset, fit: BoxFit.fitHeight),
                      Text(_hint[index].name)
                    ],
                  )
                ),
              ),
            );
          }
      ),
    );
  }
  
}