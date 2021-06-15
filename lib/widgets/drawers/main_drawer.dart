import 'package:flutter/material.dart';
import '../../screens/summary_output/summary_output.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/fblogo.png'),
                        )
                    )
                ),
                Center(child: Text('Vardenis Pavardenis', style: TextStyle(fontSize: 18, color: Colors.white))),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Konspektai'),
            onTap: () {
              Navigator.pushNamed(context, '/konspektai');
            },
          ),
        ],
      ),
    );
  }
}
