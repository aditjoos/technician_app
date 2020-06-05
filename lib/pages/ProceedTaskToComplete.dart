import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_app/components/Container.dart';
import 'package:technician_app/components/Dialogs.dart';

class ProceedTaskToCompletePage extends StatefulWidget {
  @override
  _ProceedTaskToCompletePageState createState() => _ProceedTaskToCompletePageState();
}

class _ProceedTaskToCompletePageState extends State<ProceedTaskToCompletePage> {

  bool bottomSheetIsOpened = false;
  double bottomSheetHeight = 0;

  File _image;

  Future getImage(bool chosenIsCamera) async {
    final _picker = ImagePicker();
    PickedFile pickedImage;

    if(chosenIsCamera) pickedImage = await _picker.getImage(source: ImageSource.camera);
    else pickedImage = await _picker.getImage(source: ImageSource.gallery);

    Navigator.pop(context);

    setState(() {
      _image = File(pickedImage.path);
    });
  }

  chooseimageSource() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => FunkyDialog(
        Center(
          child: Padding(padding: EdgeInsets.only(top: 15.0), child: Text('Choose image source'),),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(onPressed: () => getImage(false), child: Text('Gallery')),
              FlatButton(onPressed: () => getImage(true), child: Text('Camera')),
            ],
          ),
        ),
        MainAxisSize.min
      )
    );
  }

  _setTaskCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('taskIsCompleted', true);
  }

  _getCurrentLocation() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => FunkyLoading()
    );

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Navigator.pop(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => FunkyDialog(
        Center(
          child: Padding(padding: EdgeInsets.only(top: 15.0), child: Text('My location : '+position.toString()),),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
            ],
          ),
        ),
        MainAxisSize.min
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    SafeArea(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(LineAwesomeIcons.arrow_left),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: MyContainer(
                        width: double.infinity,
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Update Task', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0,),),
                            SizedBox(height: 20.0,),
                            MyDetailContent(
                              icon: Icon(LineAwesomeIcons.tasks),
                              child: Text('Status', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic), overflow: TextOverflow.fade,),
                              action: true,
                              actionOnTap: () => setState(() {
                                bottomSheetIsOpened = true;
                                bottomSheetHeight = 145.0;
                              }),
                            ),
                            SizedBox(height: 15.0,),
                            MyDetailContent(
                              icon: Icon(LineAwesomeIcons.sticky_note),
                              child: TextField(
                                style: TextStyle(color: Colors.black54, fontStyle: FontStyle.italic),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                                  hintText: 'Notes'
                                ),
                              ),
                              action: false,
                            ),
                            SizedBox(height: 15.0,),
                            //container for photo
                            _image != null ? Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height - 60.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.file(_image, fit: BoxFit.fill,)
                                    ),
                                  ),
                                  Positioned(
                                    top: 10.0,
                                    right: 10.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(15.0)
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () => chooseimageSource(),
                                          borderRadius: BorderRadius.circular(25.0),
                                          splashColor: Colors.black26,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                            child: Row(
                                              children: <Widget>[
                                                Text('Change picture ', style: TextStyle(color: Colors.white),),
                                                Icon(LineAwesomeIcons.camera, color: Colors.white,)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ) : MyContainer(
                              width: double.infinity,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => chooseimageSource(),
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Todo List', style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 22.0,),),
                                        SizedBox(height: 20.0,),
                                        Icon(LineAwesomeIcons.camera, size: 100, color: Colors.grey,),
                                        SizedBox(height: 20.0,),
                                        Text('Tap here to take a picture or choose image from gallery', style: TextStyle(fontSize: 14.0, color: Colors.grey), textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0,),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red[300],
                                borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) => FunkyDialog(
                                        Center(
                                          child: Padding(padding: EdgeInsets.only(top: 15.0), child: Text('Proceed to completed?'),),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              FlatButton(onPressed: () => Navigator.pop(context), child: Text('No')),
                                              FlatButton(onPressed: (){
                                                _setTaskCompleted();
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              }, child: Text('Yes')),
                                            ],
                                          ),
                                        ),
                                        MainAxisSize.min
                                      )
                                    );
                                  },
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(child: Text('Send!', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0,),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.cyan[300],
                                borderRadius: BorderRadius.circular(30.0)
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _getCurrentLocation();
                                  },
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Center(child: Text('-test current location-', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomSheetIsOpened ? Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() {
                bottomSheetIsOpened = false;
                bottomSheetHeight = 0;
              }),
              child: Container(color: Colors.black45,)),
          ) : Container(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 800),
              curve: Curves.easeInOutCirc,
              height: bottomSheetHeight,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                color: Colors.white,
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => setState(() {
                            bottomSheetIsOpened = false;
                            bottomSheetHeight = 0;
                          }),
                          borderRadius: BorderRadius.circular(30.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(child: Text('Item 1', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0, color: Colors.black),)),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => setState(() {
                            bottomSheetIsOpened = false;
                            bottomSheetHeight = 0;
                          }),
                          borderRadius: BorderRadius.circular(30.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(child: Text('Item 2', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0, color: Colors.black),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDetailContent extends StatelessWidget {
  MyDetailContent({this.child, this.icon, this.action, this.actionOnTap});

  final Widget child;
  final Icon icon;
  final bool action;
  final VoidCallback actionOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: icon,
              ),
              Flexible(
                child: child,
              ),
            ],
          ),
        ),
        action ? Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30.0),
            onTap: actionOnTap,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(LineAwesomeIcons.angle_right),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}