import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isButtonActive = false;
  late TextEditingController controller = TextEditingController();
  late TextEditingController controlleremail = TextEditingController();
    late TextEditingController controllerPassword = TextEditingController();


  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controlleremail = TextEditingController();

    controller.addListener(login);
    controlleremail.addListener(login);
    controllerPassword.addListener(login);

    
  }
void login() {
    setState(() {
      if (controller.text.isNotEmpty &&
          controlleremail.text.isNotEmpty &&
          controllerPassword.text.isNotEmpty) {
        isButtonActive = true;
      } else {
        isButtonActive = false;
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    controlleremail.dispose();
    super.dispose();
  }

  List Gender = ["Male", "Female"];
  String Gender_type = "Male";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text("Welcome Message"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://www.pngitem.com/pimgs/m/626-6265850_group-s-contacts-people-lock-secure-security-password.png',
              height: 180,
            ),

            //  Icon(
            //             Icons.people_alt,
            //             size: 80.0,
            //           ),
            //           SizedBox(height: 20.0),

            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'NAME',
                    ),
                    controller: controller,
                  ),
                  SizedBox(height: 16),
                  TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'EMAIL',
                      ),
                      controller: controlleremail),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'PASSWORD',
                      
                    ),controller: controllerPassword
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  DropdownButtonFormField(
                    value: Gender_type,
                    onChanged: (String? newValue) {
                      setState(() {
                        Gender_type = newValue ?? "";
                      });
                    },
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    items:
                        Gender.map<DropdownMenuItem<String>>((newValue) {
                      return DropdownMenuItem(
                        child: Text(newValue),
                        value: newValue,
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  ElevatedButton(
                    child: Text('LOGIN',),
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 92, vertical: 10),
                        primary: Colors.green,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    onPressed: !isButtonActive
                        ? null:() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                         
                            controller.clear();
                            controlleremail.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("SUCCESFULLY SIGN IN",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20)),
                              // duration: const Duration(seconds: 2),
                            ));
                            // validation purpose
                          }
                       
                  )
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
