// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:need2give/constants/global.dart';

// ignore_for_file: must_be_immutable
class profile extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 21, bottom: 21, left: 15, right: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                margin: EdgeInsets.only(top: 30),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Icon(
                      Icons.person,
                      size: 200,
                    ),
                    InkWell(
                      onTap: () {
                        // Add the function you want to execute when the button is clicked
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Global.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 44, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Username",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Ayla",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )
                    ])),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 29, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(bottom: 1),
                          child: Text(
                            "Email",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 1),
                          child: Text(
                            "aylahmadi2016@gmail.com",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ))
                    ])),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 28, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "+961 81 088 604",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )
                    ])),
            Padding(
                padding: EdgeInsets.only(top: 39),
                child:
                    Divider(height: 2, thickness: 2, color: Global.darkGrey)),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 30, right: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gender",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Male",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )
                    ])),
            Padding(
                padding:
                    EdgeInsets.only(left: 16, top: 29, right: 16, bottom: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date of birth",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "08/09/2003",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      )
                    ]))
          ])),
    ));
  }
}
