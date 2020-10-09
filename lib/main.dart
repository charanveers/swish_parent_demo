import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter/material.dart';
import 'marchin_wallet.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MarchinWallet(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Country _selected;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
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
      body: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: [

              Container(
                child: Image.asset(
                  'images/main_logo.png',
                  height: 130,
                  width: 130,
                ),
                margin: EdgeInsets.only(top: 50),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Get Started",
                  style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Join us to keep tabs on the activities \n and reward!",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 30,left: 30),
                child: Text(
                  "Enter your mobile number",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,),
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        child: CountryPicker(
                          showDialingCode: true,
                          showFlag: false,
                          showName: false,
                          onChanged: (Country country){
                            setState(() {
                              _selected = country;
                            });
                          },
                          selectedCountry: _selected,
                        ),
                      ),
                      Expanded(child: TextField(
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => FocusScope.of(context).unfocus(),
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding:
                            EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "Phone number"),
                      )
                      )
                    ],
                  ),
                ),

              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                child:  RaisedButton(
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Colors.lightBlueAccent)),
                  onPressed: () {
                  },
                  color: Colors.lightBlueAccent,
                  textColor: Colors.white,
                  child: Text("Continue",
                      style: TextStyle(fontSize: 12)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By Signing up you agree to ",
                      style: new TextStyle(
                          fontSize: 13.0,
                          color: Colors.black87,
                      ),
                    ),
                    Text(
                      "Terms of Use",
                      style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )),

        ],
      ),
    );
  }
}
