import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swish_parents/slider_thumb_shape.dart';

class MarchinWallet extends StatefulWidget {
  @override
  _MarchinWalletState createState() => _MarchinWalletState();
}

class _MarchinWalletState extends State<MarchinWallet> {
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
                  Text("Marchin Wallet",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)
                ],
              ),
            ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],

                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                ),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Text("Credit date: 12th of every month"),
              ),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 20),
               padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 30),
               width: double.infinity,
               decoration: BoxDecoration(
                 boxShadow: [BoxShadow(
                   color: Colors.grey[300],
                   blurRadius: 5.0,
                 ),],
                   borderRadius: BorderRadius.all(Radius.circular(20)),
                 image: DecorationImage(
                   image: AssetImage("images/cardbg.png"),
                   fit: BoxFit.cover,
                 ),
               ),
               child:Column(
                 children: [
                   Align(
                     child: Image(image: AssetImage("images/refreshnew.png"),width: 20,height: 20,),
                     alignment: Alignment.topRight,
                   ),
                   Text("Total Wallet Amount",style: TextStyle(fontSize: 12,color:Colors.grey),),
                   SizedBox(height: 10,),
                   Text("1260.00/SAR",style: TextStyle(fontSize: 20,color:Colors.lightGreen),),
                   SizedBox(height: 20,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       _cardRow("1260.00/SAR","Total Wallet Amount"),
                       Container(
                         width: 1,
                         height: 40,
                         color: Colors.grey[300],
                       ),
                       _cardRow("1260.00/SAR","Total Wallet Amount")
                     ],
                   )
                 ],
               )
             ),
             SizedBox(
               height: 15,
             ),
             Padding(padding: EdgeInsets.symmetric(horizontal: 20),
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Expanded(child: _customButton(Color(0xff64D2FF),"Add Fund",AssetImage("images/refreshnew.png")),),
                 SizedBox(width: 30,),
                 Expanded(child:  _customButton(Color(0xffE33359),"Deduct Fund",AssetImage("images/refreshnew.png")),),
               ],
             ),
             ),
              Expanded(child: Container(color: Colors.lightGreen,child:  ListView.builder(
                itemCount: 6,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      _bottomsheet();
                    },
                    child:_rewardRow() ,
                  );
                },
              ),))

            ],
          )),
    );
  }
   _rewardRow()
   {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,),
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
            Divider()
          ],
        ));
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
                                        width: 50.0,
                                        height: 50.0,
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
                              child: _customTextFields("Enter amount",Icon(null),false),
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
                            SizedBox(
                              height: 10,
                            ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child:     Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text("Saving Account",style: TextStyle(fontSize: 10,color: Colors.black),),
                              Text("Expenses Account",style: TextStyle(fontSize: 10,color: Colors.black),)

                            ],
                          ),
                        ),
                            SliderTheme(
                              data: SliderThemeData(
                                activeTrackColor: Colors.blue,
                                inactiveTrackColor: Color(0xffd0d2d3),
                                trackHeight: 1,
                              ),
                              child: RangeSlider(
                                onChanged: (value) {},
                                values: values,
                                max: 100,
                                min: 0,
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child:     Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("0%",style: TextStyle(fontSize: 12,color: Colors.black),),
                                  Text("100%",style: TextStyle(fontSize: 12,color: Colors.black),)

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(padding: EdgeInsets.only(left: 20),child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Add a message",style: TextStyle(fontSize: 12,color: Colors.black),),
                            ),),
                            SizedBox(
                              height: 10,
                            ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:     TextField(
                          maxLines: 3,
                            textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              borderSide: BorderSide.none
                            ),
                            contentPadding: EdgeInsets.only(left: 30),
                            hintText: 'Bio',
                            hintStyle: TextStyle(
                              height: 4.8,
                            ),
                            fillColor: Colors.grey[200],
                            filled: true,

                          ),
                        ),),
                            SizedBox(
                              height: 10,
                            ),
                            _normalButton(Colors.lightBlue, "Add Fund", Colors.lightBlue, 20, EdgeInsets.symmetric(horizontal: 100,vertical: 15), TextStyle(fontSize: 12,color: Colors.white))
                          ],
                        )),
                  ),
                );
              });

        });
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

  _customButton(Color btnColor,String txt,AssetImage assetImage)
{
  return  RaisedButton(
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),),
      onPressed: () {
      },
      color: btnColor,
      textColor: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: assetImage,width: 10,height: 10,),
          SizedBox(width: 10,),
          Text(txt,
              style: TextStyle(fontSize: 12,color: Colors.white))
        ],
      )
  );

}
_cardRow(String value,String placeholder)
{
  return Column(
    children: [
      Text(value,style: TextStyle(fontSize: 20,color:Colors.black),),
      SizedBox(height: 10,),
      Row(
        children: [
          Image(image: AssetImage("images/refreshnew.png"),width: 10,height: 10,),
          SizedBox(width: 5,),
          Text(placeholder,style: TextStyle(fontSize: 12,color:Colors.grey),),
        ],
      )
    ],
  );

}






}
