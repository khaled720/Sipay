import"package:flutter/material.dart";
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class dplSettings extends StatefulWidget {
  dplSettings({Key key}) : super(key: key);

  @override
  _dplSettingsState createState() => _dplSettingsState();
}

class _dplSettingsState extends State<dplSettings> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: Text('DPL SETTINGS'),
          flexibleSpace: Image(
            image: AssetImage('assets/appbar_bg.png'),
            height: 100,
            fit: BoxFit.fitWidth,
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              padding: const EdgeInsets.only(right: 20.0),
              icon: Icon(
                FontAwesomeIcons.commentAlt,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
          body: Container(
       
      ),
    );
  }
}