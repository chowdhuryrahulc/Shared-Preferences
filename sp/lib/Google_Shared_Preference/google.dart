import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp/Google_Shared_Preference/dashboard.dart';

GoogleSignInAccount? A;
GoogleSignIn sign = GoogleSignIn();
late SharedPreferences logindata;
late bool newuser;

class google extends StatefulWidget {
  const google({Key? key}) : super(key: key);

  @override
  _googleState createState() => _googleState();
}

class _googleState extends State<google> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
          onPressed: () async {
            await sign.signIn();
            print('Successfull');
            logindata.setBool('login', false);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyDashboard()));

            // final SharedPreferences SP =
            //     await SharedPreferences.setBool("loggedIn", true);

            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Firstpage()));
            // Navigator.push(context, MaterialPageRoute(builder: builder))
            // Navigator.pushReplacementNamed(context, "/firstpage");
          },
          child: Text("Sign In via Google")),
    ));
  }
}
