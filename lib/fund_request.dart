import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swish_parents/slider_thumb_shape.dart';

class FundRequest extends StatefulWidget {
  @override
  _FundRequestState createState() => _FundRequestState();
}

class _FundRequestState extends State<FundRequest> {
  RangeValues values=new RangeValues(1, 100);

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
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),]
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back,color: Colors.black,size: 30,),
                    SizedBox(width: 20,),
                    Text("Fund Request",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                ),
              ),
              Expanded(child:  Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: ListView(
                  children: [

                    _rowAcadmic("Your child just finished up with cleaning.","Milestone 01"),
                    _rowAcadmic("Your child daily cleans his room.","Chores"),
                    _rowAcadmic("Your child just finished up with cleaning.","Milestone 01"),

                  ],
                ),
              ))

            ],
          )),
    );
  }

  _rowAcadmic(String title,String desc) {
    return InkWell(
      onTap: (){
        _bottomsheetLoanRequest();
      },
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,

          ),

          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration:BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200])),
            ) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        width: 40.0,
                        height: 40.0,
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100],
                                blurRadius: 15.0,
                              ),
                            ],
                            border: Border.all(color: Colors.white, width: 2),
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage(
                                    "images/academics.png")))),
                    Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  title,
                                  style: new TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _normalButton(Color.fromRGBO(100, 210, 255, 0.10), "Add Fund", Color.fromRGBO(100, 210, 255, 0.30), 30, EdgeInsets.symmetric(horizontal: 10), TextStyle(fontSize: 12,color: Color.fromRGBO(100, 210, 255, 1))),
                                  SizedBox(width: 10,),
                                  _normalButton(Color.fromRGBO(227, 51, 89, 0.30), "Decline", Color.fromRGBO(227, 51, 89, 0.30), 30, EdgeInsets.symmetric(horizontal: 10), TextStyle(fontSize: 12,color: Color.fromRGBO(227, 51, 89, 1)))
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

  _bottomsheetFoundRequest() {
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

                        padding: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Column(
                                children: [

                                  Text(
                                    "400/ SAR",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Fund Request",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "by Marchin Smith",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                           Align(
                             alignment: Alignment.topLeft,
                             child:  Text(
                               "Reason",
                               style: TextStyle(
                                   fontSize: 17,
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black),
                             ),
                           ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "01. Publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[400]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _normalButton(Color.fromRGBO(227, 51, 89, 0.30), "Decline", Color.fromRGBO(227, 51, 89, 0.30), 30, EdgeInsets.symmetric(horizontal: 50,vertical: 15), TextStyle(fontSize: 12,color: Color.fromRGBO(227, 51, 89, 1))),
                                SizedBox(width: 10,),
                                _normalButton(Color.fromRGBO(100, 210, 255, 0.10), "Accept", Color.fromRGBO(100, 210, 255, 0.30), 30, EdgeInsets.symmetric(horizontal: 50,vertical: 15), TextStyle(fontSize: 12,color: Color.fromRGBO(100, 210, 255, 1))),
                              ],
                            )
                          ],
                        )),
                  ),
                );
              });

        });
  }
  _bottomsheetLoanRequest() {
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

                        padding: EdgeInsets.only(bottom: 20,left: 20,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Column(
                                children: [

                                  Text(
                                    "400/ SAR",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Fund Request",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "by Marchin Smith",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child:  Text(
                                "Reason",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "01. Publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[400]),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child:  Text(
                                "Will payback by",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                _customTextFields("Enter Will payback by",Icon(Icons.calendar_today_rounded),false) ,
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _normalButton(Color.fromRGBO(227, 51, 89, 0.30), "Decline", Color.fromRGBO(227, 51, 89, 0.30), 30, EdgeInsets.symmetric(horizontal: 50,vertical: 15), TextStyle(fontSize: 12,color: Color.fromRGBO(227, 51, 89, 1))),
                                SizedBox(width: 10,),
                                _normalButton(Color.fromRGBO(100, 210, 255, 0.10), "Accept", Color.fromRGBO(100, 210, 255, 0.30), 30, EdgeInsets.symmetric(horizontal: 50,vertical: 15), TextStyle(fontSize: 12,color: Color.fromRGBO(100, 210, 255, 1))),
                              ],
                            )
                          ],
                        )),
                  ),
                );
              });

        });
  }
  _customTextFields(String text,Icon icon,bool disable) {
    return TextField(
      readOnly: disable,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          hintText:text,
          filled: true,
          suffixIcon:icon,
          fillColor: Colors.grey[200],
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              borderSide: BorderSide.none)),
    );
  }
  _normalButton(Color borderColor,String text,Color btnColor,double buttonRadius,EdgeInsets padding,TextStyle textStyle )
  {
    return RaisedButton(
        elevation: 0,
        padding:padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: () {
        },
        color: btnColor,
        textColor: btnColor,
        child: Text(text,
            style: textStyle)
    );
  }
}
