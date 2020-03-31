import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgets {

  static PreferredSizeWidget appBar(String title, List<Widget> actions, {Color color = Colors.amber}) {
    return AppBar(
      backgroundColor: color,
      centerTitle: true,
      title: Text(title,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
      actions: actions,
      iconTheme: IconThemeData(color: Colors.black54),
    );
  }

  static Drawer drawer() {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
      DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
          child: Text(
            'About',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 24,
            ),
          )),
      ListTile(
        title: Text("Created By"),
        subtitle: Text("Yomer Gonzalez"),
      ),
      ListTile(
        title: Text("Powered By:"),
        subtitle: Text("API Transporte Gob de Buenos aires"),
      )
    ]));
  }

  static Container containerBackground(Widget child) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("subte.jpg"), fit: BoxFit.cover)),
        child: child);
  }

}
