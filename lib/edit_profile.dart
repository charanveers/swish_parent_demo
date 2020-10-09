import 'dart:io';

import 'package:swish_parents/widgets/fileWidgets.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int radioValue = 0;
  DateTime selectedDate = DateTime.now();
  WidgetsFile widgetsFile = new WidgetsFile();
  var txt = TextEditingController();
  var name = TextEditingController();
  String _fullName,lastName,mobile,emailAddress,institutionName;
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(
              // Here we create one to set status bar color
              backgroundColor: Colors
                  .black, // Set any color of status bar you want; or it default to your theme's primary color
            )),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Text(
                        "Edit Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Stack(
                          children: [
                            widgetsFile.circleImageView(
                                80, 80, AssetImage("images/dummy.jpg")),
                            Positioned(
                              right: 0,
                              bottom: 7,
                              child: GestureDetector(
                                  onTap: () {
                                  },
                                  child: widgetsFile.circleIconButton(
                                      25,
                                      25,
                                      Icons.camera_alt_outlined,
                                      Colors.grey[200],
                                      Colors.grey[200])),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("Gender"),
                                ),
                                Row(
                                  children: [
                                    Expanded(child: _customRadioButton("Male",1,AssetImage("images/ic_male.png"))),
                                    SizedBox(width: 30),
                                    Expanded(child: _customRadioButton("Female",2,AssetImage("images/ic_female.png"))),
                                  ],
                                ),
                                _customTextFields("Full Name","Enter Name",name),
                                _customTextFields("Last Name","Enter Last Name",name),
                                GestureDetector(
                                  onTap: (){
                                    _selectDate(context);
                                  },
                                  child: AbsorbPointer(child: _customTextFields("Date of Birth","Select Date",txt)),
                                ),
                                _customTextFields("Mobile Number","Enter Number",name),
                                _customTextFields("Email Address","Enter Email",name),
                                _customTextFields("Institution Name","Enter Name",name),
                                SizedBox(
                                  height: 30,
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              SizedBox(
                                width: double.infinity,
                                child:  RaisedButton(
                                  padding: EdgeInsets.all(15),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: Colors.lightBlueAccent)),
                                  onPressed: () {


                                  },
                                  color: Colors.lightBlueAccent,
                                  textColor: Colors.white,
                                  child: Text("Save Changes",
                                      style: TextStyle(fontSize: 12)),
                                ),
                              )
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        txt.text = "${picked.toLocal()}".split(' ')[0];
      });
  }

  _customTextFields(String title,String hint,TextEditingController text)
  {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: 15,bottom: 10),
          child: Text(title),
        ),
        TextField(
          textInputAction: TextInputAction.done,
          onEditingComplete: () => FocusScope.of(context).unfocus(),
          cursorColor: Colors.black,
          controller: text,
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[100],
              border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                  borderSide: BorderSide.none
              )
          ),
        ),
      ],
    );

  }

  _customRadioButton(String text,double value,AssetImage img)
  {
    return  RaisedButton(
        highlightElevation: 0,
        elevation: 0,
        padding: EdgeInsets.only(left: 10 ,right: 5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.grey[200])),
        onPressed: (){

        },
        color: Colors.white,
        textColor: Colors.white,
        child: Row(
          children: [
            Image(image:img,height: 20,width: 20,),
           Expanded(child:  Padding(padding: EdgeInsets.only(left: 5),
             child: Text(text,
                 style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.center,),
           ),),
            Radio(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                activeColor: Colors.lightGreen,
                groupValue: radioValue,
                onChanged: (val) {
                  setState(() {
                    radioValue = val;
                  });
                }),
          ],)
    );
  }
}
Widget circleImageView(double height , double width,ImageProvider image)
{
  return Container(
      margin: EdgeInsets.only(bottom: 7),
      width: width,
      height: height,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: image)));

}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}