// ignore: file_names
import 'package:flutter/material.dart';
import 'package:home_ui/utils/mysmartbox.dart';

class HomePage extends StatefulWidget {
    HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalpadding = 40;

  final double verticalpadding= 25;

  //list of devices
  List mySmartDevices = [
    //[smartdevicename, iconpath, powerstatus]
    ["Smart Light", "lib/icons/light.png", true],
    ["Smart AC", "lib/icons/Ac.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
    ["Game Setup", "lib/icons/game.png", true],
    ["Smart TV", "lib/icons/tv.png", false],
    



  ];

void powerSwitchChanged(bool value, index){
setState(() {
  mySmartDevices[index][2] = value;
  
});


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],

      body:  SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            //app bar
           Padding(padding: EdgeInsets.symmetric(
            horizontal: horizontalpadding,
            vertical: verticalpadding),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/icons/menu.png',height: 50,),
                 
                Image.asset('lib/icons/profile.png',height:50)
              ],
             ),
           ),

           const SizedBox(height: 20,),

                 
            //welcome text
         Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hey Emir,",
              style: TextStyle(fontSize: 40),
          ),
          Text("Welcome to the Home UI",
          style: TextStyle(
            fontSize: 30),
          )
            ],
          ),
        ),
      
      const SizedBox(height: 20,),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Text("Smart devices",
              style:TextStyle(fontSize: 20),
              ),
            ),
            //smartdevices grid
            Expanded(
              
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: EdgeInsets.all(20.0),
              gridDelegate: 
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1.3,
                ),
             itemBuilder: (context, index){
              return MySmartDevicesBox(
                iconpath: mySmartDevices[index][1],
                smartdevicename: mySmartDevices[index][0],
                powerOn: mySmartDevices[index][2],
                onChanged: (value) => powerSwitchChanged(value,index),
              );
             }
             )
             )
      
      
      
      
      
          ],
      
        ),
      ),

    




    );
  }
}