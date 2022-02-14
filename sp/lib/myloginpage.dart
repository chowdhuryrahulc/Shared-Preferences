import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/dashboard.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // final username_controller = TextEditingController();
  // final password_controller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => MyDashboard()));
    }
  }

  // @override
  // void dispose() {
  // Clean up the controller when the widget is disposed.
  //   username_controller.dispose();
  //   password_controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Shared Preferences"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "To show Example of Shared Preferences",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: TextField(
            //     controller: username_controller,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'username',
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: TextField(
            //     controller: password_controller,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Password',
            //     ),
            //   ),
            // ),
            ElevatedButton(
              // textColor: Colors.white,
              // color: Colors.blue,
              onPressed: () {
                // String username = username_controller.text;
                // String password = password_controller.text;
                // if (username != '' && password != '') {
                print('Successfull');
                logindata.setBool('login', false);
                // logindata.setString('username', username);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyDashboard()));
                // }
              },
              child: Text("Log-In"),
            )
          ],
        ),
      ),
    );
  }
}
