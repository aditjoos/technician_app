import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_app/components/Dialogs.dart';
import 'package:technician_app/pages/ProceedTaskToComplete.dart';

class TaskDetailPage extends StatefulWidget {
  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {

  String taskId = '';
  bool taskIsCompleted = false;

  double taskCompletedContainerHeight = 0;

  String dateTimeNow = '';

  @override
  void initState() {
    super.initState();
    _checkValues();
  }

  _checkValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      taskId = prefs.getString('taskId');
      taskIsCompleted = prefs.getBool('taskIsCompleted');
    });
  }

  _dateNow() {
    DateTime now = new DateTime.now();
    var format = DateFormat('dd MMMM yyyy @H:m');
    setState(() {
      dateTimeNow = format.format(now);
    });
  }

  setTaskCompleted() {
    setState(() {
      taskIsCompleted = true;
      taskCompletedContainerHeight = 80.0;
    });
    _dateNow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
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
                Center(
                  child: Icon(!taskIsCompleted ? Icons.close : Icons.check, size: 100.0, color: !taskIsCompleted ? Colors.red[400] : Colors.green[400],),
                ),
                Center(child: Text(!taskIsCompleted ? 'Task Uncompleted' : 'Task Completed', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0,),)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  MyDetailContent(
                    action: false,
                    icon: Icon(LineAwesomeIcons.tag),
                    title: 'Task No.',
                    subtitle: '#232324232',
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    action: false,
                    icon: Icon(LineAwesomeIcons.user),
                    title: 'Customer Name',
                    subtitle: 'Mr. Budi Susanto',
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    icon: Icon(LineAwesomeIcons.phone),
                    title: 'Phone Number',
                    subtitle: '08221123123',
                    action: true,
                    actionOnTap: (){},
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    icon: Icon(LineAwesomeIcons.map_signs),
                    title: 'Address',
                    subtitle: '(Address) Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                    action: true,
                    actionOnTap: (){},
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    icon: Icon(LineAwesomeIcons.map_signs),
                    title: 'Location Details',
                    subtitle: 'Location Details',
                    action: true,
                    actionOnTap: (){},
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    action: false,
                    icon: Icon(LineAwesomeIcons.info_circle),
                    title: 'Task Type',
                    subtitle: 'Replace Cartridge',
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    action: false,
                    icon: Icon(LineAwesomeIcons.calendar),
                    title: 'Task Started',
                    subtitle: '20 September 2018 @15:77',
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  AnimatedContainer(
                    height: taskCompletedContainerHeight,
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeInOutCirc,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 15.0,),
                          MyDetailContent(
                            action: false,
                            icon: Icon(LineAwesomeIcons.calendar),
                            title: 'Task Completed',
                            subtitle: dateTimeNow,
                          ),
                          SizedBox(height: 15.0,),
                          Divider(
                            color: Colors.grey[300],
                            height: 1.0,
                            thickness: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  MyDetailContent(
                    action: false,
                    icon: Icon(LineAwesomeIcons.sticky_note),
                    title: 'Notes',
                    subtitle: 'Subtitles',
                  ),
                  SizedBox(height: 30.0,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: taskIsCompleted ? Colors.green[400] : Colors.red[300],
                      borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          if(taskIsCompleted){
                            Navigator.pop(context);
                          }else{
                            Navigator.push(context, MaterialPageRoute(builder: (_) => ProceedTaskToCompletePage()));
                          }
                        },
                        borderRadius: BorderRadius.circular(30.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(child: Text(taskIsCompleted ? 'Done' : 'Set to Completed', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDetailContent extends StatelessWidget {
  MyDetailContent({this.icon, this.title, this.subtitle, this.action, this.actionOnTap});

  final Icon icon;
  final String title;
  final String subtitle;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(child: Text(subtitle, style: TextStyle(color: Colors.grey,), overflow: TextOverflow.fade,)),
                  ],
                ),
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