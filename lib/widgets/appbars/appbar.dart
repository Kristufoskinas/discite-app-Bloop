import 'package:flutter/material.dart';
import 'local/appbar_clipper.dart';
class Appbar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
            margin: EdgeInsets.only(top: 30),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/fblogo.png'),
                )
            )
        ),
        actions: [
          // Container(
          //   margin: EdgeInsets.only(top: 15),
          //   child: IconButton(
          //     icon: Icon(Icons.settings),
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(
          //           builder: (context){
          //             return Scaffold(
          //               body: Center(child: Text('Čia bus nustatymai')),
          //             );
          //           }
          //       ));
          //     },
          //     iconSize: 36.0,
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 15),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                if(Scaffold.of(context).isEndDrawerOpen) Navigator.pop(context);
                //if drawer is open, then close the drawer
                else Scaffold.of(context).openEndDrawer();
                //if drawer is closed then open the drawer.
              },
              iconSize: 36.0,
            ),
          ),
        ],
        flexibleSpace: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                tileMode: TileMode.clamp,
              )
            ),
          ),
        ),
      ),
    );
  }
}


