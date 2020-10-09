import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swish_parents/privacy_policy.dart';

import 'about_us.dart';
import 'contact_us.dart';
import 'edit_profile.dart';
import 'my_child.dart';

class ParentHome extends StatefulWidget {
  @override
  _ParentHomeState createState() => _ParentHomeState();
}

class _ParentHomeState extends State<ParentHome> {
  String code = "";
  final etOne = TextEditingController();
  final etTwo = TextEditingController();
  final etThree = TextEditingController();
  final etFour = TextEditingController();
  int _selectedIndex = 0;
  DateTime selectedDate = DateTime.now();


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
          child: SingleChildScrollView(
              child: _selectedIndex == 0 ? homeui() : _selectedIndex == 1
                  ? Container(
                child: Text("charanveer"),

              )
                  : myProfile()

          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[


          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            title: Text('My Activity'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text('My Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget myProfile() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 50),
          decoration: new BoxDecoration(
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/home_bg.png")),
            boxShadow: [],
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Text(
                      "SWISH",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Text(
                          "My Profile",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 7),
                        width: 80.0,
                        height: 80.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("images/dummy.jpg")))),
                  ],
                ),
              ),
              Text(
                "Charanveer singh",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "5412568245",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: borderButton(
                    Colors.lightGreen,
                    "Edit Profile",
                    Colors.grey[50],
                    20,
                    EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    TextStyle(color: Colors.lightGreen, fontSize: 13), () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EditProfile()));
                }),
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 20),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyChild()));
                  },
                  child: rowWidgeds(
                      "My Child", AssetImage("images/my_child.png"), false),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyChild()));
                  },
                  child: rowWidgeds(
                      "Child Guardians", AssetImage("images/guardians.png"), false),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AboutUs()));
                  },
                  child: rowWidgeds(
                      "Payment Detailss", AssetImage("images/payment.png"), false),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AboutUs()));
                  },
                  child: rowWidgeds(
                      "About Us", AssetImage("images/about.png"), false),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => PrivacyPolicy()));
                  },
                  child: rowWidgeds("Privacy Policy",
                      AssetImage("images/privacy.png"), false),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ContactUs()));
                  },
                  child: rowWidgeds("Contact Us",
                      AssetImage("images/contact_us.png"), false),
                ),
                GestureDetector(
                  onTap: () {
                    _modalBottomSheetMenu();
                  },
                  child: rowWidgeds(
                      "Log Out", AssetImage("images/logout.png"), true),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return new Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              //could change this to Color(0xFF737373),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure ?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            "Are you sure you want to logout of the application.",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[400],
                                fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: customButton()),
                      Expanded(child: customButton())
                    ],
                  )
                ],
              ));
        });
  }

  Widget borderButton(Color borderColor, String text, Color btnColor,
      double buttonRadius, EdgeInsets padding, TextStyle textStyle,
      VoidCallback tap) {
    return RaisedButton(
        elevation: 0,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            side: BorderSide(color: borderColor)),
        onPressed: tap,
        color: btnColor,
        textColor: Colors.lightBlueAccent,
        child: Text(text,
            style: textStyle)
    );
  }

  Widget customButton() {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, top: 25),
      child: RaisedButton(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.lightBlueAccent)),
        onPressed: () {},
        color: Colors.lightBlueAccent,
        textColor: Colors.white,
        child: Text("Verify", style: TextStyle(fontSize: 12)),
      ),
    );
  }

  Widget rowWidgeds(String text, AssetImage img, bool isLogOut) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Image(
            image: img,
            height: 30,
            width: 30,
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(bottom: 1),
                  color: Colors.grey[200],
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              text,
                              style: TextStyle(color: Colors.black),
                            )),
                        !isLogOut
                            ? Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey[300],
                        )
                            : Container()
                      ],
                    ),
                  )))
        ],
      ),
    );
  }

  Widget settingType(String text, double margin, IconData icon) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(icon),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
              offset: Offset(10.0, 5.0),
              blurRadius: 5.0,
              spreadRadius: 0,
              color: Colors.grey[300]),
        ],
      ),
    );
  }

  Widget circleIconButton(double height, double width, IconData icon,
      Color borderColor, Color btnColor) {
    return Container(
        width: width,
        height: height,
        child: Icon(icon, size: 15,),
        decoration: new BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.all(Radius.circular(height / 2)),
          border: Border.all(color: borderColor),

        ));
  }
  Widget homeui() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 20),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/home_bg.png"))),
          child: Column(
            children: [

              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "SWISH",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Guardiansds",
                    style:
                    TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Stack(
                        children: [
                          circleImageView(
                              30, 30, AssetImage("images/dummy.jpg")),
                          Positioned(
                            left: 20,
                            child: circleImageView(
                                30, 30, AssetImage("images/dummy.jpg")),),
                          Positioned(
                            left: 40,
                            child: circleImageView(
                                30, 30, AssetImage("images/dummy.jpg")),),
                        ],
                      ))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "My Child",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(4 Child)",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                height: 90,
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        blurRadius: 10.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    border: Border.all(color: Colors.white54)),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: new BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Add Child",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            row_Mychild(50, 50,
                                AssetImage("images/dummy.jpg"),
                                "child name"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                  elevation: 2,
                  margin: EdgeInsets.only(
                      left: 20, right: 20, top: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.white,
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/cardbg.png"))),
                    width: double.infinity,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Image(
                                image: AssetImage(
                                    "images/refresh.png"),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                crossAxisAlignment: CrossAxisAlignment
                                    .center,
                                children: [
                                  Text(
                                    'Your Wallet',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    '1260.00/SAR',
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                '960.00/SAR',
                                                textAlign: TextAlign
                                                    .start,
                                                style: TextStyle(
                                                    color: Colors
                                                        .black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                              Text(
                                                'Saving Account',
                                                textAlign: TextAlign
                                                    .start,
                                                style: TextStyle(
                                                  color: Colors
                                                      .black45,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text('540.00/SAR',
                                                textAlign: TextAlign
                                                    .start,
                                                style: TextStyle(
                                                    color: Colors
                                                        .black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            Text(
                                              'Expense Account',
                                              textAlign: TextAlign
                                                  .start,
                                              style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          )
                        ]),
                  )),
            ],
          ),
        ),

        Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20,),
                      Column(
                        children: [
                          acadmicCell(true,Color.fromRGBO(255, 74, 104, 1),"Academics","Academic performance report.")
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          acadmicCell(false,Color.fromRGBO(27, 229, 95, 1),"Health Goals","Marchin's complete 1000 steps.")
                        ],
                      )
                    ],
                  ),),
                  SizedBox(width: 20,),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20,),
                      Column(
                        children: [

                          acadmicCell(false,Color.fromRGBO(192, 158, 122, 1),"Chores","Your child just finished up with cleaning.")
                        ],
                      ),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          acadmicCell(false,Color.fromRGBO(27, 143, 249, 1),"Fund Request","Marchin just requested of fund transfer for 100 SAR.")
                        ],
                      )
                    ],
                  ),)
                ],

              ),)
        ),


      ],
    );
  }

  Widget acadmicCell(bool isUpdate,Color color,String title,String desc) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          color: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ SizedBox(height: 10,),
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      desc,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 5,),
                    isUpdate ?
                    Text(
                      "Uploaded by institute",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ) : Container(),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.1),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Expanded(child: Text(
                      "View More",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),),
                    Icon(
                      Icons.arrow_forward_ios, color: Colors.white, size: 15,)

                  ],

                ),
              )
            ],
          ),));
  }


  Widget circleImageView(double height, double width, ImageProvider image) {
    return Container(
        margin: EdgeInsets.only(bottom: 7),
        width: width,
        height: height,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(fit: BoxFit.cover, image: image)));
  }

  Widget row_Mychild(double height, double width, ImageProvider image,
      String childName) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 7),
            width: width,
            height: height,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(fit: BoxFit.cover, image: image))),
        Text(
          childName,
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
