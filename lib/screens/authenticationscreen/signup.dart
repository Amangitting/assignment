import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restapiasses/screens/authenticationscreen/login.dart';
import 'package:get/get.dart';
import 'package:restapiasses/widgets/customtext.dart';

import '../../services/apiservices/apiServices.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  var _formkey = GlobalKey<FormState>();

  services ser = services();

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
        backgroundColor: Colors.green,
        title: Text("signup"),
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
                      return null;
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
                        .createUserWithEmailAndPassword(
                            email: emailcontroller.text.toString(),
                            password: passwordcontroller.text.toString())
                        .then((value) {
                      Get.snackbar("Succesfully", "registered");
                    }).onError((error, stackTrace) {
                      Get.snackbar("error", error.toString().substring(30));
                    });
                  }
                },
                child: Customtext(
                    text: "Signup",
                    Colorr: Colors.white,
                    size: 20,
                    fontsize: FontWeight.w300)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("login"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
