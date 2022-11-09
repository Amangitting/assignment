import "package:flutter/material.dart";
import "package:restapiasses/controllers/controllers.dart";
import 'package:get/get.dart';
import "package:restapiasses/screens/userScreen/DetailsScreen.dart";
import "package:restapiasses/services/apiservices/apiServices.dart";
import "package:restapiasses/widgets/customtext.dart";

userController usercontroller = Get.put(userController());

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Users"),
            ),
            body: Obx(() {
              if (usercontroller.IsLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: usercontroller.userList[0].data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = usercontroller.userList[0].data[index];
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      firstname: data.firstName.toString(),
                                      lastname: data.lastName.toString(),
                                      email: data.email.toString(),
                                      id: data.id,
                                    )))),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Customtext(
                                    text: data.firstName.toString() +
                                        " " +
                                        data.lastName.toString(),
                                    Colorr: Colors.white,
                                    size: 20,
                                    fontsize: FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                Customtext(
                                    text: "Email:   " + data.email.toString(),
                                    Colorr: Colors.black,
                                    size: 15,
                                    fontsize: FontWeight.normal)
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data.avatar.toString()),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            })));
  }
}
