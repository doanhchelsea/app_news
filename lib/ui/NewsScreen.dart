import 'package:appnews/data/culturalnews.dart';
import 'package:appnews/data/economynews.dart';
import 'package:appnews/data/sciencenews.dart';
import 'package:appnews/data/societynews.dart';
import 'package:appnews/data/worldnews.dart';
import 'package:appnews/ui/DetailNewsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/news.dart';
import '../ui/DetailNewsScreen.dart';



class NewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewScreenSate();
  }
}

class _NewScreenSate extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("VNEXPRESS NEWS"),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 6.0,
            tabs: <Widget>[
              Tab(
                child: Container(
                  child: Text(
                    'XÃ HỘI',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'THẾ GIỚI',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'KINH TẾ',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'KHOA HỌC',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  child: Text(
                    'VĂN HÓA',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            SocietyNews(),
            WorldNews(),
            EconomyNews(),
            ScienceNews(),
            CulturalNews(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
