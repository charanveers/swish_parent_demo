import 'package:flutter/material.dart';


class ContactUs extends StatelessWidget {
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
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Contact Us",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
       Expanded(child: Image(image: AssetImage("images/ilustration.png"),)),
            Expanded(child: Column(
              children: [
                SizedBox(height: 50,),
              Row(children: [
                SizedBox(width: 20,),
                Expanded(child: Text("Get into touch if you \nneed help",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.start,))],),
                SizedBox(height: 8,),
                Row(children: [
                  SizedBox(width: 20,),
                  Expanded(child: Text("We are happy to serve you.",style: TextStyle(fontSize: 15,color: Colors.grey[400],fontWeight: FontWeight.normal),textAlign: TextAlign.start,))],),
                SizedBox(height: 40,),
                Row(children: [
                  SizedBox(width: 20,),
                  Expanded(child: Text("Malaz Dist, Riyadh Malaz\nP.O.Box : 8101,\nSaudi Arabia",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal),textAlign: TextAlign.start,))],),
                SizedBox(height: 10,),
                Row(children: [
                  SizedBox(width: 20,),
                  Expanded(child: Text("support@swishfintech.com",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal),textAlign: TextAlign.start,))],),
                SizedBox(height: 10,),
                Row(children: [
                  SizedBox(width: 20,),
                  Expanded(child: Text("+96 76897 97776",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal),textAlign: TextAlign.start,)),
                  Image(image: AssetImage("images/email.png"),height: 35,width: 35,),
                  SizedBox(width: 10,),
                  Image(image: AssetImage("images/callicon.png"),height: 35,width: 35,),
                  SizedBox(width: 20,),
                ],),
              ],)),

          ],
        ),

      ),
    );
  }
}
