import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapiasses/screens/authenticationscreen/login.dart';
import 'package:restapiasses/screens/authenticationscreen/signup.dart';
import 'package:restapiasses/screens/splash%20screen/splashscreen.dart';
import 'package:restapiasses/screens/userScreen/DetailsScreen.dart';
import 'package:restapiasses/screens/userScreen/usersScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: " resp api",
      home: SplashScreen(),
    );
  }
}
