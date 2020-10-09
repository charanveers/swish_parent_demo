import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swish_parents/slider_thumb_shape.dart';

class Acadmics extends StatefulWidget {
  @override
  _AcadmicsState createState() => _AcadmicsState();
}

class _AcadmicsState extends State<Acadmics> {
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
                    Text("Academics",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
                  ],
                ),
              ),
              Expanded(child:  Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: ListView(
                  children: [
                    _rowAcadmic("aademic","Academic performance report.","Uploaded by institute",Colors.transparent,""),
                    _rowAcadmic("bad","Bad behaviour was reported","Uploaded by institute",Colors.lightBlue,"Add Fund"),
                    _rowAcadmic("bad","Bad behaviour was reported","Uploaded by institute",Colors.redAccent,"Deduct"),
                  ],
                ),
              ))

            ],
          )),
    );
  }
  _rowAcadmic(String type,String title,String desc,Color btnColor,String btnText) {
    return Container(
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
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                desc,
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                           Align(
                            alignment: Alignment.topLeft,
                            child:type=="aademic"?  Container(
                              padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.grey[200])),
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image(
                                    image:
                                    AssetImage("images/performance.png"),
                                    height: 15,
                                    width: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Performance_report",
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ):  _normalButton(Colors.lightBlue, btnText,btnColor, 20, EdgeInsets.symmetric(horizontal: 20), TextStyle(fontSize: 12,color: Colors.white)),
                          )

                          ],
                        ),
                      ))
                ],
              ),
            ],
          ),
        )
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
