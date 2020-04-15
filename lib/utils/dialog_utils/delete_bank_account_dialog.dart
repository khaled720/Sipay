import 'package:flutter/material.dart';

class DeleteBankAccountDialog {
  static showDeleteDialog(BuildContext context, Function onDelete) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete Bank Account"),
            content: Text("Are you sure you want to delete this account?"),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  await onDelete();
                  Navigator.of(context).pop();
                },
                child: Text("Delete"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              )
            ],
          );
        });
  }
}
