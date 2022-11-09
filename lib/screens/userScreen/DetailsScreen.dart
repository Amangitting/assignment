import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:restapiasses/services/apiservices/apiServices.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  String? firstname;
  String? lastname;
  String? email;
  int id;
  DetailScreen(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  services ser = services();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  void initState() {
    firstnamecontroller.text = widget.firstname.toString();
    lastnamecontroller.text = widget.lastname.toString();
    emailcontroller.text = widget.email.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Edit user"),
      ),
      body: Column(children: [
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
                controller: firstnamecontroller,
                decoration: InputDecoration(
                  labelText: "first name",
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
                controller: lastnamecontroller,
                decoration: InputDecoration(
                  labelText: "Last name",
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
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              debugPrint("---------");
              updateuser();
            },
            child: Text("Submit"))
      ]),
    ));
  }

  Future updateuser() async {
    var url = "https://reqres.in/api/users";
    var firstname = firstnamecontroller.text.toString();
    var lastname = firstnamecontroller.text.toString();
    var email = emailcontroller.text.toString();
    if (firstname.isNotEmpty && email.isNotEmpty && lastname.isNotEmpty) {
      var data = json.encode({
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
      });
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: data);
      if (response.statusCode == 201) {
        debugPrint("""-------api hit sucesfully-------
        because reqres.in is providing us dummy apis, 
        http.put or post mettod would not work in actual way
        although it successfully hitting api with statuscode 200""");
        var messageSuccess = json.decode(response.body)['message'];
        Get.snackbar("user updated ", messageSuccess.toString());
      }
    }
  }
}
