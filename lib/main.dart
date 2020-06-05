import 'package:flutter/material.dart';
import 'package:technician_app/ForgotPhoneNumber.dart';
import 'package:technician_app/pages/TodoList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technician App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Image.asset('assets/images/login-bg.png', fit: BoxFit.cover,)),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(size: 100.0,),
                    SizedBox(height: 100.0,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 10.0,
                            spreadRadius: 1.0
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Technician Login', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24.0, fontStyle: FontStyle.italic),),
                          SizedBox(height: 15.0,),
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              hintText: 'Phone number',
                              hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.grey),
                            ),
                            style: TextStyle(fontSize: 16.0,),
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
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TodoListPage())),
                                borderRadius: BorderRadius.circular(30.0),
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Center(child: Text('Login', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white),)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPhoneNumberPage())),
                        borderRadius: BorderRadius.circular(30.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Forgot your phone number?'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
