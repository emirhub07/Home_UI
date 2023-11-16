import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MySmartDevicesBox extends StatelessWidget {
  
  final String smartdevicename;
  final String iconpath;
  final bool powerOn;
  void Function(bool)? onChanged;


   MySmartDevicesBox({
    super.key,
     required this.smartdevicename, 
     required this.iconpath, 
     required this.powerOn,
     required this.onChanged,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(       
        
        decoration: BoxDecoration(    
             
          color: powerOn? Colors.grey[700]: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
          
          
        ),
        
         padding: EdgeInsets.symmetric(horizontal: 8),
       child: Column(
        
      children: [


        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 0),
          child: Image.asset(iconpath, height: 100,
          color: powerOn? Colors.white : Colors.black,),
        ),


        
        Padding(
          padding:  EdgeInsets.only(bottom: 10,right: 3,top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: 
              
              
                
                 Text(smartdevicename,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: powerOn? Colors.white: Colors.black,
                  fontSize: 20,
                  fontFamily: AutofillHints.birthday
                ),
                ),
              ),
        
              SizedBox(
                width: 5,
                height: 0,
              ),
                 Transform.rotate(
                  angle: pi /2,
                  child: CupertinoSwitch(value: powerOn, 
                  onChanged: onChanged
                    
                  ,),
                ),
              
            ],
          ),
        )
      ],
       ),
      ),
    );
  }
}