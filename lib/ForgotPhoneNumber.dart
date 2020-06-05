import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ForgotPhoneNumberPage extends StatefulWidget {
  @override
  _ForgotPhoneNumberPageState createState() => _ForgotPhoneNumberPageState();
}

class _ForgotPhoneNumberPageState extends State<ForgotPhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(LineAwesomeIcons.arrow_left),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('Forgot phone number', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0,),),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Please Contact Us', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20.0,),),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(50.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(LineAwesomeIcons.phone, size: 60.0, color: Colors.green[300],),
                          )),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(50.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(LineAwesomeIcons.whatsapp, size: 60.0, color: Colors.green[300],),
                          )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}