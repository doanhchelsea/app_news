import 'package:appnews/ui/NewsScreen.dart';
import 'package:appnews/model/category.dart';
import 'package:appnews/ui/DetailNewsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewScreenSate();
  }
}

class _NewScreenSate extends State<NewScreen>
    with SingleTickerProviderStateMixin {

  Future getData() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('category').getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData ? DefaultTabController(
            length: snapshot.data.length,
            child: Scaffold(
              appBar: AppBar(
                title: Text("VNEXPRESS NEWS"),
                bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  indicatorWeight: 6.0,
                  tabs: List.generate(
                    snapshot.data.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(snapshot.data[index].data['name'], style: TextStyle(color: Colors.white, fontSize: 18.0),),
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: List.generate(
                    snapshot.data.length,
                        (index) => NewsScreen(int.parse(snapshot.data[index].data['id']))
                ),
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
                      title: Text('Test'),
                      onTap: () {

                      },
                    ),
//                    ListTile(
//                      title: Text('Item 2'),
//                      onTap: () {
//                        Navigator.pop(context);
//                      },
//                    ),
                  ],
                ),
              ),
            ),
          ) : Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
