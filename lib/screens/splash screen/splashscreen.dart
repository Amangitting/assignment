import 'package:flutter/material.dart';
import 'package:restapiasses/services/splashservices/splashservices.dart';
import 'package:restapiasses/widgets/customtext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    splashServices.isLogin(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    splashServices.isLogin(context);
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Customtext(
            text: "Assignmnet ",
            Colorr: Colors.black,
            size: 30,
            fontsize: FontWeight.w300),
      ),
    );
  }
}
