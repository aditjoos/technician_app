import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technician_app/components/Container.dart';
import 'package:technician_app/pages/TaskDetail.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  
  bool isTabCompleted = false;

  Future setValuesForTaskDetail(String taskId, bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('taskId', taskId);
    prefs.setBool('taskIsCompleted', isCompleted);
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(LineAwesomeIcons.arrow_left),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text('Budi Susanti'),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('Todo List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0,),),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: isTabCompleted ? Colors.white : Colors.grey[300],
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() => isTabCompleted = false),
                    borderRadius: BorderRadius.circular(30.0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Center(child: Text('Open', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: isTabCompleted ? Colors.grey : Colors.black),)),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Container(
                decoration: BoxDecoration(
                  color: isTabCompleted ? Colors.grey[300] : Colors.white,
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() => isTabCompleted = true),
                    borderRadius: BorderRadius.circular(30.0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      child: Center(child: Text('Completed', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: isTabCompleted ? Colors.black : Colors.grey),)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: !isTabCompleted ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  MyTodoListContainer(
                    onTap: () {
                      setValuesForTaskDetail('T0001', false);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailPage()));
                    },
                    customerName: 'Customer name',
                    isCompleted: false,
                    taskDetail: 'New Installation - 20 September 2020 @12:00',
                    taskAddress: '(Address detail) Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                  ),
                  MyTodoListContainer(
                    onTap: () {
                      setValuesForTaskDetail('T0001', false);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailPage()));
                    },
                    customerName: 'Customer name',
                    isCompleted: false,
                    taskDetail: 'New Installation - 20 September 2020 @12:00',
                    taskAddress: '(Address detail) Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                  ),
                  MyTodoListContainer(
                    onTap: () {
                      setValuesForTaskDetail('T0001', false);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailPage()));
                    },
                    customerName: 'Customer name',
                    isCompleted: false,
                    taskDetail: 'New Installation - 20 September 2020 @12:00',
                    taskAddress: '(Address detail) Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                  ),
                ],
              ),
            ) : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  MyTodoListContainer(
                    onTap: () {
                      setValuesForTaskDetail('T0001', true);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailPage()));
                    },
                    customerName: 'Customer name',
                    isCompleted: true,
                    taskDetail: 'New Installation - 20 September 2020 @12:00',
                    taskAddress: '(Address detail) Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                  ),
                  MyTodoListContainer(
                    onTap: () {
                      setValuesForTaskDetail('T0001', true);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TaskDetailPage()));
                    },
                    customerName: 'Customer name',
                    isCompleted: true,
                    taskDetail: 'New Installation - 20 September 2020 @12:00',
                    taskAddress: '(Address detail) Lorem ipsum dolor sit amet consectetur adipiscing elit.',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.blue
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(30.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Refresh ', style: TextStyle(color: Colors.white),),
                  Icon(LineAwesomeIcons.refresh, color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTodoListContainer extends StatelessWidget {
  MyTodoListContainer({this.onTap, this.customerName, this.isCompleted, this.taskAddress, this.taskDetail});

  final VoidCallback onTap;
  final String customerName;
  final bool isCompleted;
  final String taskDetail;
  final String taskAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MyContainer(
        width: double.infinity,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                        decoration: BoxDecoration(
                          color: isCompleted ? Colors.green[400] : Colors.cyan[400],
                          borderRadius: BorderRadius.circular(7.0)
                        ),
                        child: Text(isCompleted ? 'Completed' : 'Open', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(LineAwesomeIcons.clock_o),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(customerName, style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(taskDetail, style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Divider(
                    color: Colors.grey[300],
                    height: 1.0,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 15.0,),
                  Text(taskAddress, style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}