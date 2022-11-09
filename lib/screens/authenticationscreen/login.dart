import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:restapiasses/screens/authenticationscreen/signup.dart';
import 'package:restapiasses/screens/userScreen/usersScreen.dart';
import 'package:restapiasses/services/apiservices/apiServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();

  services ser = services();

  FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

  @override
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Login"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter email";
                      }
                      if (!value.contains("@")) {
                        return "@ must include";
                      }
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: "email",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password";
                      }
                    },
                    obscureText: true,
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      labelText: "password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password";
                      }
                      if (passwordcontroller.text != confirmcontroller.text) {
                        return "password and cofirm password must be equal";
                      }
                    },
                    controller: confirmcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "confirm password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _auth
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text.toString(),
                            password: passwordcontroller.text.toString())
                        .then((value) {
                      Get.snackbar("Succesfully", "logged in");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserScreen()));
                    }).onError((error, stackTrace) {
                      Get.snackbar("Error", error.toString().substring(30));
                    });
                  }
                },
                child: Text("Login")),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("dont have an account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("signup"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
