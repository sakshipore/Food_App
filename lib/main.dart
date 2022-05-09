import 'package:flutter/material.dart';
import 'package:food_app/localdb.dart';
import 'package:food_app/pages/google_signin.dart';
import 'package:food_app/pages/home_page.dart';
import 'package:food_app/pages/login_page.dart';
import 'package:food_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isLogIn = false;
  getLoggedInState() async {
    await LocalDataSaver.getLogData().then((value) => {
          setState(() {
            isLogIn = value!;
          })
        });
  }

  @override
  void initState() {
    initState();
    getLoggedInState();
  }

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.loginRoute,
        routes: {
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.googleRoute: (context) => GoogleSignIn(),
          MyRoutes.homeRoute:(context) => HomePage(),
        });
  }

  setState(Null Function() param0) {}
}
