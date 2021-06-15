import 'package:flutter/material.dart';
import 'package:project/screens/add/camera.dart';
import 'package:project/screens/settings.dart';
import 'package:project/screens/summaries/summaries.dart';
import 'package:project/services/storage.dart';

class BottomNav extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: Colors.black,
      // currentIndex: 1,
      
      onTap: (index) async => {
        if( index == 2 ){
          await StorageService().createFakeEntries(),

        },

        Navigator.popUntil(context, ModalRoute.withName(SummariesScreen.routeName)),
        Navigator.pushNamed(context, SummariesScreen.routeName),

        if (index == 1){
          Navigator.pushNamed(context, CameraScreen.routeName),
    }
    //     else if(index == 2){
    //       // Navigator.pushNamed(context, SettingsScreen.routeName),
    //       await StorageService().createFakeEntries(),
    // }
      },
      
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset("assets/navbar/home.png", scale: 1.3,),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/navbar/plus.png", scale: 1.3,),
          label: "Add text",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/navbar/settings.png", scale: 1.3,),
          label: "Settings",
        ),
      ],
    );
  }

}

