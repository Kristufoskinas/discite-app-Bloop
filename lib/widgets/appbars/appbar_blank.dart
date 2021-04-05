import 'package:flutter/material.dart';
import 'local/appbar_clipper.dart';
class AppbarBlank extends StatelessWidget implements PreferredSizeWidget{
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
        ),
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



