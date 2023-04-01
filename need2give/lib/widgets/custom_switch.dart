// ignore_for_file: use_key_in_widget_constructors, unnecessary_new, camel_case_types

import 'package:flutter/material.dart';

class custom_switch extends StatefulWidget {  
  @override  
  SwitchClass createState() => new SwitchClass();  
}  
  
class SwitchClass extends State {  
  bool isSwitched = false;   
  
  void toggleSwitch(bool value) {  
  
    if(isSwitched == false)  
    {  
      setState(() {  
        isSwitched = true;  
      });  
    }  
    else  
    {  
      setState(() {  
        isSwitched = false;   
      });
    }  
  }  
  @override  
  Widget build(BuildContext context) {  
    return Column(  
        mainAxisAlignment: MainAxisAlignment.end,  
        children:[ Transform.scale(  
            scale: 2,  
            child: Switch(  
              onChanged: toggleSwitch,  
              value: isSwitched,  
              activeColor: Colors.green,  
              activeTrackColor: Colors.lightGreen,  
              inactiveThumbColor: Colors.grey.shade700,  
              inactiveTrackColor: Colors.grey,  
            )  
          ),   
        ]);  
  }  
}  