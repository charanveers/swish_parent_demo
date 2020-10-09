
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../edit_profile.dart';

class WidgetsFile
{
  Widget customText(String text,double size,FontWeight weight,Color color,TextAlign align,EdgeInsets margin)
  {
    return Container(
      margin:margin ,
      child: Text(
        text,
        textAlign: align,
        style:TextStyle(fontSize: size,fontWeight:weight,color: color) ,
      ),
    );
  }
  Widget imageWidget(AssetImage image,double height,double width,BoxFit fit,EdgeInsets margin)
  {
    return Container(
        margin: margin,
        child: Image(image:image,height:height ,width: width,fit: fit));

  }
  Widget iconText(String text,IconData icon,double size,Color textcolor,Color backColor,Color borderColor,FontWeight style)
  {
   return Container(
        margin: const EdgeInsets.only(left:5.0),
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        decoration: BoxDecoration(
            color:backColor ,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: borderColor)
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon,size: 10,color: Colors.yellow[700],),
              Expanded(child: Text(text,textAlign:TextAlign.center,style: TextStyle(fontSize: size,color: textcolor)))
            ]
        )
    );
  }
  Widget borderButton(Color borderColor,String text,Color btnColor,double buttonRadius,EdgeInsets padding,TextStyle textStyle ,VoidCallback tap)
  {
    return RaisedButton(
        elevation: 0,
        padding: padding,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            side: BorderSide(color: borderColor)),
        onPressed:tap,
        color: btnColor,
        textColor: Colors.lightBlueAccent,
        child: Text(text,
            style: textStyle)
    );
  }
  Widget normalButton(Color borderColor,String text,Color btnColor,double buttonRadius,EdgeInsets padding,TextStyle textStyle )
  {
    return RaisedButton(
        elevation: 0,
        padding: EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: borderColor)),
        onPressed: () {
        },
        color: Colors.white,
        textColor: Colors.white,
        child: Text("Add Test Marks",
            style: TextStyle(fontSize: 12,color: Colors.lightBlueAccent))
    );
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
  Widget circleIconButton(double height , double width,IconData icon,Color borderColor,Color btnColor)
  {
    return Container(
        width: width,
        height: height,
        child:Icon(icon,size: 15,),
        decoration: new BoxDecoration(
          color: btnColor,
            borderRadius: BorderRadius.all(Radius.circular(height/2)),
            border: Border.all(color: borderColor),

            ));
  }
  showToastMessage(String msg)
  {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}