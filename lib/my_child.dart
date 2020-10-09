import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swish_parents/privacy_policy.dart';

import 'about_us.dart';
import 'contact_us.dart';
import 'edit_profile.dart';

class MyChild extends StatefulWidget {
  @override
  _MyChildState createState() => _MyChildState();
}

class _MyChildState extends State<MyChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            // Here we create one to set status bar color
            backgroundColor: Colors
                .black, // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 10.0,
                    ),
                  ]),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Text(
                          "My Child",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(child:GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: <Widget>[
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild(),
                    _rowMyChild()
                  ],
                )
                ),
              ]
            ),
          )
      ),
    );
  }

  _rowMyChild()
  {
    return    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 7),
            width: 50,
            height: 50,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 5.0,
                ),],
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/dummy.jpg")))),
        SizedBox(height: 6,),
        Text("CharanVeer",style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        Text("1st Child",style: TextStyle(fontSize: 15,color: Colors.grey[500],fontWeight: FontWeight.normal),)

      ],
    );
  }

}
