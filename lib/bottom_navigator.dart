import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/withdrawal/witdrawal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getCustomNavigator(BuildContext context, List<String> menu, int select) {
  List<bool> selection = [false, false, false, false];
  selection[select] = true;
  return Align(
    alignment: Alignment.bottomCenter,
    child: SizedBox(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: selection[0] ? Colors.white : Colors.blue,
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.map,
                      color: selection[0] ? Colors.blue : Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      menu[0],
                      style: TextStyle(
                        color: selection[0] ? Colors.blue : Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  if (select == 0) return;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/deposit_panel');
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: selection[1] ? Colors.white : Colors.blue,
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.paperPlane,
                      color: selection[1] ? Colors.blue : Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      menu[1],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: selection[1] ? Colors.blue : Colors.white,
                          fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  if (select == 1) return;
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: selection[2] ? Colors.white : Colors.blue,
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.database,
                      color: selection[2] ? Colors.blue : Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      menu[2],
                      style: TextStyle(
                          color: selection[2] ? Colors.blue : Colors.white,
                          fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  if (select == 2) return;
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WithdrawalPanelScreen(),
                      ));
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: selection[3] ? Colors.white : Colors.blue,
              child: FlatButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.exchangeAlt,
                      color: selection[3] ? Colors.blue : Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      menu[3],
                      style: TextStyle(
                          color: selection[3] ? Colors.blue : Colors.white,
                          fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  if (select == 3) return;
                },
              ),
            ),
          ),
        ],
      ),
      height: 60,
      width: double.infinity,
    ),
  );
}
