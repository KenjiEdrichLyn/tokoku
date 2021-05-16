import 'package:flutter/material.dart';
import 'package:toko_online/view/sneaker_tab.dart';
import 'package:toko_online/view/watch_tab.dart';
import 'package:toko_online/view/backpack_tab.dart';
import 'package:toko_online/view/search_screen.dart';
import 'package:toko_online/resources/project_colors.dart';

class HomeScreen extends StatelessWidget{
  var bello;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height:100,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      color: transparent,
                      image: DecorationImage(fit: BoxFit.fitWidth,image: AssetImage("images/background.jpg"))
                  ), 
                  child: Center(child: Text("Menus", style: TextStyle(fontSize: 30, fontFamily: "NunitoBold", color: Colors.white))),
                ),
              ),
              InkWell(child: ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Search'),
                ),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/search');
                },
              ),
              InkWell(child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Cart'),
              ),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ],
          ),
        ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
                icon: Icon(Icons.apps, color: black),
                onPressed: () => Scaffold.of(context).openDrawer()
            );
          }
        ),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0,
        title: Container(
            margin: EdgeInsets.only(top:5),
            child: Image.asset('images/xe_logo_transparent.png', fit: BoxFit.contain, height: 160, width: 160,)
        ),
        actions: <Widget>[
          IconButton(color: black,icon: Icon(Icons.search), onPressed: () {
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
              backgroundColor: transparent,
              bottom: TabBar(
                labelPadding: EdgeInsets.only(left: 25, right: 25),
                isScrollable: true,
                labelColor: purple,
                indicatorColor: purple,
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
                    color: black
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