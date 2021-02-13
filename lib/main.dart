import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _formKey = GlobalKey<FormState>();

  String password;
  String rePassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forms'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (val) => val.contains('@') ? null : 'Enter a valid email',
                  decoration: InputDecoration(
                    hintText: 'Email',
                    icon: Icon(
                      CupertinoIcons.mail
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val) => val.length > 6 ? null : 'Enter a longer password',
                  decoration: InputDecoration(
                    hintText: 'Password',
                    icon: Icon(
                        CupertinoIcons.lock
                    ),
                  ),
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  validator: (val) => rePassword == password ? null : 'Passwords do not match',
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    icon: Icon(
                        CupertinoIcons.arrow_clockwise,
                    ),
                  ),
                  onChanged: (val){
                    setState(() {
                      rePassword = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RawMaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  fillColor: Colors.blue,
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      //met all requirements
                      print('Signed Up');
                    }else{
                      // hasn't met requirements
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
