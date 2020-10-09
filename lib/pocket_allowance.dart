import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swish_parents/slider_thumb_shape.dart';

class PocketAllowance extends StatefulWidget {
  @override
  _PocketAllowanceState createState() => _PocketAllowanceState();
}

class _PocketAllowanceState extends State<PocketAllowance> {
  RangeValues values = new RangeValues(1, 100);
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ]),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Pocket Allowance",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                                child: Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.orange,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("images/dummy.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Michal Smith",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "4rt Child",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Enter amount",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: _customTextFields(
                            "Enter amount", Icon(null), false),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Set how much goes into wallet",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey[400]),
                      ),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child:   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _borderButton(),
                          _borderButton(),
                        ],
                      ),
                    ),
                      SizedBox(
                        height: 20,
                      ),
                     Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:  Text(
                       "Let us know how would you like to distribute the money between the accounts fot the pocket allowance",
                       style: TextStyle(
                           fontSize: 11,
                           fontWeight: FontWeight.normal,
                           color: Colors.grey[400]),
                     ),),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Saving Account",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            ),
                            Text(
                              "Expenses Account",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.black),
                            )
                          ],
                        ),
                      ),

                  Slider(
                    min: 0,
                    value: _currentSliderValue,
                    max: 100,
                    divisions: 5,
                    onChanged: (double value) {
                      setState(() {
                      });
                    },
                  ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "0%",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            Text(
                              "100%",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      ),



                      SizedBox(
                        height: 30,
                      ),
                      _normalButton(
                          Colors.lightBlue,
                          "Save & Proceed",
                          Color(0xff64D2FF),
                          20,
                          EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                          TextStyle(fontSize: 12, color: Colors.white))
                    ],
                  )),
            ),
          )
        ],
      )),
    );
  }
_borderButton()
{
  return   Container(
    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey)
    ),
    child:  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: AssetImage("images/privacy.png"),height: 25,width: 25,),
        SizedBox(
          width: 10,
        ),
        Text(
          "Saving Account",
          style:
          TextStyle(fontSize: 10, color: Colors.black),
        )
      ],
    ),
  );

}
  _customTextFields(String text, Icon icon, bool disable) {
    return TextField(
      readOnly: disable,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          hintText: text,
          filled: true,
          suffixIcon: icon,
          fillColor: Colors.grey[200],
          border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              borderSide: BorderSide.none)),
    );
  }

  _normalButton(Color borderColor, String text, Color btnColor,
      double buttonRadius, EdgeInsets padding, TextStyle textStyle) {
    return RaisedButton(
        elevation: 0,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {},
        color: btnColor,
        textColor: btnColor,
        child: Text(text, style: textStyle));
  }
}
