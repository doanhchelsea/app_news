import 'package:appnews/model/user.dart';
import 'package:appnews/ui/LoginScreen.dart';
import 'package:flutter/material.dart';

class RegisterScreenState extends State<RegisterScreen> {
  final User user = new User();

  @override
  Widget build(BuildContext context) {
    final TextField _txtFirstName = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter your first name',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      onChanged: (text) {
        setState(() {
          this.user.firstName = text;
        });
      },
    );
    final TextField _txtLastName = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter your last name',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.text,
      onChanged: (text) {
        setState(() {
          this.user.lastName = text;
        });
      },
    );
    final TextField _txtEmail = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter your email',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (text) {
        setState(() {
          this.user.email = text;
        });
      },
    );
    final TextField _txtPassword = new TextField(
      decoration: new InputDecoration(
        hintText: 'Enter your password',
        contentPadding: new EdgeInsets.all(10.0),
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (text) {
        setState(() {
//          this.user.password = text;
        });
      },
      obscureText: true,
    );
    // TODO: implement build
    return new Scaffold(

      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            decoration: new BoxDecoration(
                color: new Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                const BorderRadius.all(const Radius.circular(32.0))),
            child: _txtFirstName,
          ),
          new Container(
            margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            decoration: new BoxDecoration(
                color: new Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                const BorderRadius.all(const Radius.circular(32.0))),
            child: _txtLastName,
          ),
          new Container(
            margin: new EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
            decoration: new BoxDecoration(
                color: new Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                const BorderRadius.all(const Radius.circular(32.0))),
            child: _txtEmail,
          ),
          new Container(
            margin: new EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: new BoxDecoration(
                color: new Color.fromARGB(255, 240, 240, 240),
                borderRadius:
                const BorderRadius.all(const Radius.circular(32.0))),
            child: _txtPassword,
          ),
          new Container(
            margin: new EdgeInsets.all(20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                    color: Colors.blue,
                    child: new Text("SIGN UP"),
                    onPressed: () {
                      print('Username : ${user.email}, ');
                    },
                  ),
                )
              ],
            ),
          ),
          new Container(
//            margin: new EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text("Have an account ?"),
          ),
          new Container(
            margin: new EdgeInsets.only(right: 20.0, left: 20.0,top: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new RaisedButton(
                    color: Colors.blue,
                    child: new Text("LOGIN"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  RegisterScreenState();
  }
}
