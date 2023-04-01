// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:need2give/widgets/backButton.dart';

class terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                leading: backButton(),
                centerTitle: true,
                title: Text("Terms And Conditions")),
            body: ListView(
              children: [
                Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(
                        left: 16, top: 28, right: 16, bottom: 28),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem ipsum",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                          Container(
                              width: 394,
                              margin: EdgeInsets.only(top: 12),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum vulputate nisi aenean risus, nulla ultrices feugiat facilisi ut. In nunc tincidunt dolor placerat suscipit. Risus justo elementum at in malesuada fringilla lacus pellentesque.",
                                maxLines: null,
                                textAlign: TextAlign.left,
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.blueGrey)),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Lorem ipsum",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                          Container(
                              width: 394,
                              margin: EdgeInsets.only(top: 12),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum vulputate nisi aenean risus, nulla ultrices feugiat facilisi ut. In nunc tincidunt dolor placerat suscipit. Risus justo elementum at in malesuada fringilla lacus pellentesque.",
                                maxLines: null,
                                textAlign: TextAlign.left,
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.blueGrey)),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Lorem ipsum",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                          Container(
                              width: 394,
                              margin: EdgeInsets.only(top: 12),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum vulputate nisi aenean risus, nulla ultrices feugiat facilisi ut. In nunc tincidunt dolor placerat suscipit. Risus justo elementum at in malesuada fringilla lacus pellentesque.",
                                maxLines: null,
                                textAlign: TextAlign.left,
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.blueGrey)),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                "Lorem ipsum",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              )),
                          Container(
                              width: 394,
                              margin: EdgeInsets.only(top: 12, bottom: 5),
                              child: Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Interdum vulputate nisi aenean risus, nulla ultrices feugiat facilisi ut. In nunc tincidunt dolor placerat suscipit. Risus justo elementum at in malesuada fringilla lacus pellentesque.",
                                maxLines: null,
                                textAlign: TextAlign.left,
                              ))
                        ]))
              ],
            )));
  }

  onTapArrowleft3(BuildContext context) {
    Navigator.pop(context);
  }
}
