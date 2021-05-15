import 'package:flutter/material.dart';
import 'package:toko_online/sneaker_tab.dart';
import 'package:toko_online/watch_tab.dart';
import 'package:toko_online/backpack_tab.dart';
import 'package:toko_online/search_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.apps)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
            margin: EdgeInsets.only(top:5),
            child: Image.asset('images/xe_logo_transparent.png', fit: BoxFit.contain, height: 160, width: 160,)
        ),
        actions: <Widget>[
          IconButton(color: Colors.black,icon: Icon(Icons.search), onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => SearchScreen()
            ));
          })
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pushNamed('/cart');},
        child: Icon(Icons.shopping_cart, color: Colors.blue[100],),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:DefaultTabController(
        length: 3,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: new Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              bottom: TabBar(
                labelPadding: EdgeInsets.only(left: 25, right: 25),
                isScrollable: true,
                labelColor: Colors.deepPurpleAccent[400],
                indicatorColor: Colors.deepPurpleAccent[400],
                unselectedLabelColor: Colors.black54,
                labelStyle: TextStyle(
                  fontFamily: 'NunitoBold',
                  fontSize: 12
                ),
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only( top:6, right:4, bottom:6),
                          child: Image.asset("images/sneakers.png", height: AppBar().preferredSize.height-10, fit: BoxFit.fitHeight)
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          child: Tab(text: 'Sneaker')
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only( top:6, right:4, bottom:6),
                          child: Image.asset("images/watch.png", height: AppBar().preferredSize.height-10, fit: BoxFit.scaleDown)
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          child: Tab(text: 'Watch')
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only( top:6, right:4, bottom:6),
                          child: Image.asset("images/backpack.png", height: AppBar().preferredSize.height-10, fit: BoxFit.scaleDown)
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          child: Tab(text: 'Backpack')
                      ),
                    ],
                  )
                ],
              ),
              title: Text(
                  "Our Product",
                  style: TextStyle(
                    fontFamily: 'NunitoBold',
                    fontSize: 30,
                    color: Colors.black
                  ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SneakerTab(),
                WatchTab(),
                BackpackTab()
              ],
            ),
          ),
        ),
      )
    );
  }

}