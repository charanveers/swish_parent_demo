import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AcadmicAndChores extends StatefulWidget {
  @override
  _AcadmicAndChoresState createState() => _AcadmicAndChoresState();
}

class _AcadmicAndChoresState extends State<AcadmicAndChores> {
  String selectedTab = "Academics";
  GlobalKey globalKey = GlobalKey();
  String dropdownValue = 'One';
  List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];


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
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "SWISH",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                "Academics & Chores",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10.0),
              shrinkWrap: false,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return rowItem();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      customTabIndicator("Academics"),
                      SizedBox(
                        width: 20,
                      ),
                      customTabIndicator("Chores"),
                      SizedBox(
                        width: 20,
                      ),
                      customTabIndicator("Health Goals"),
                      SizedBox(
                        width: 20,
                      ),
                      customTabIndicator("Pocket Allowance"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Color(0xffe6f2ff),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text("Reward & Deductions"),
              ),
              Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 30, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        iconSize: 0.0,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        underline: Container(),
                        onChanged: (String data) {
                          setState(() {
                            dropdownValue = data;
                          });
                        },
                        items: spinnerItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Image(
                        image: AssetImage("images/down_arrow.png"),
                        height: 10,
                        width: 10,
                      )
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  _bottomsheet();
                },
                child: rewardRow(),
              );
            },
          ))
        ],
      )),
    );
  }
  String selectedBottomSheetTab="Never";
  _bottomSheetTab(String txt) {
    return InkWell(
      onTap: (){
        setState(() {
          selectedBottomSheetTab=txt;
        });
      },
      child:  Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.only(left: selectedBottomSheetTab==txt? 15.0:0.0,right: 15, top: 10,bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: selectedBottomSheetTab==txt?Colors.white:Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: selectedBottomSheetTab==txt?Colors.grey:Colors.transparent,
                blurRadius:selectedBottomSheetTab==txt? 5.0:0.0,
              ),
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Text(txt,style: TextStyle(fontSize: 12,color: selectedBottomSheetTab==txt?Colors.black:Colors.grey),textAlign: TextAlign.center,),),
            (selectedBottomSheetTab==txt) || (txt=="Monthly")?Container():Text("|",style: TextStyle(color: Colors.grey),),
          ],
        )
      ),
    );
  }

  Widget customTabIndicator(String tabName) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedTab = tabName;
            });
          },
          child: Text(
            tabName,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        selectedTab == tabName
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                width: 90,
                height: 6,
              )
            : Container()
      ],
    );
  }

  _weeklyTabContainer()
  {
    return Container(
      child: Column(
        children: [
       Row(
         children: [
           Flexible(child: _customTextFields("Start Date",Icon(Icons.calendar_today_rounded),true),),
           SizedBox(width: 20,),
           Flexible(child: _customTextFields("End Date",Icon(Icons.calendar_today_rounded),true),)
         ],
       ),
          Row(
            children: [
              Flexible(child: _customTextFields("Reward Amount",Icon(null),false),),
              SizedBox(width: 20,),
              Flexible(child: _customTextFields("Penalty Amount",Icon(null),false),)
            ],
          ),
          SizedBox(height: 20,),
          _normalButton(Colors.lightBlue, "Create", Colors.lightBlue, 20, EdgeInsets.symmetric(horizontal: 100,vertical: 15), TextStyle(fontSize: 12,color: Colors.white))
        ],
      ),
    );
  }
   _normalButton(Color borderColor,String text,Color btnColor,double buttonRadius,EdgeInsets padding,TextStyle textStyle )
  {
    return RaisedButton(
        elevation: 0,
        padding:padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
           ),
        onPressed: () {
        },
        color: btnColor,
        textColor: btnColor,
        child: Text(text,
            style: textStyle)
    );
  }


  _daylyTabContainer()
  {
    return Wrap(
      spacing: 10,
      children: [
    _rowWeekly(),
      _rowWeekly(),
      _rowWeekly(),
      _rowWeekly(),
      _rowWeekly(),
      _rowWeekly(),
      _rowWeekly(),
      _rowWeekly()
    ],);
  }
_rowWeekly()
{
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
    decoration: BoxDecoration(
        color: Colors.lightGreen[100],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.lightGreen)
    ),
    child: Text("Sun"),
  );
}
  _bottomsheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
                return   Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                  ),
                  child: SingleChildScrollView(
                    child: Container(

                        padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                      child: Container(
                                        width: 70.0,
                                        height: 70.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Create a Chore",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Create a Chore",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _customTextFields("Task Name",Icon(null),false),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Assign Guardian",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.only(left: 30, right: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: DropdownButton<String>(
                                              value: dropdownValue,
                                              iconSize: 0.0,
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 12),
                                              underline: Container(),
                                              onChanged: (String data) {
                                                setState(() {
                                                  dropdownValue = data;
                                                });
                                              },
                                              items: spinnerItems
                                                  .map<DropdownMenuItem<String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Image(
                                            image: AssetImage("images/down_arrow.png"),
                                            height: 10,
                                            width: 10,
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5,top:5,bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: Colors.grey[200],
                                    ),
                                    child:   Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(child: _bottomSheetTab("Never"),),
                                        Expanded(child: _bottomSheetTab("Daily"),),
                                        Expanded(child: _bottomSheetTab("Weekly"),),
                                        Expanded(child: _bottomSheetTab("Monthly"),),
                                      ],
                                    ),
                                  ),
                                 selectedBottomSheetTab=="Never" ?_weeklyTabContainer():Container(),
                                  SizedBox(height: 10,),
                                  selectedBottomSheetTab=="Daily" ?_daylyTabContainer():Container(),


                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              });

        });
  }

  _customTextFields(String text,Icon icon,bool disable) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, bottom: 10),
          child: Text(text),
        ),
        TextField(
          readOnly: disable,
          textInputAction: TextInputAction.done,
          onEditingComplete: () => FocusScope.of(context).unfocus(),
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: "hint",
              filled: true,
              suffixIcon:icon,
              fillColor: Colors.grey[200],
              border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none)),
        ),
      ],
    );
  }

  Widget rewardRow() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.lightGreen, width: 1)),
                  child: Image(
                    image: AssetImage("images/privacy.png"),
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Physics",
                      style: TextStyle(color: Colors.lightGreen, fontSize: 12),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Class test Result",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Aug 04, 2020 | 12:32 PM",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                )),
                Text(
                  "70/100",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ));
  }

  Widget rowItem() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              circleImageView(60, 60, AssetImage("images/dummy.jpg")),
              SizedBox(
                width: 15,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Marchin Smith",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Aug 17, 2002",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 8,
                          width: 8,
                          decoration: new BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: Text(
                          '+91 89589 84765',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              customRow("High School"),
              customRow("9th Grade"),
              customRow("A"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              customRow("Saudi international school"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey),
                child: Text(
                  "View institute ID",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.grey)),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget customRow(String text) {
    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
          ),
          Image(
            image: AssetImage("images/payment.png"),
            height: 15,
            width: 15,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
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
}
