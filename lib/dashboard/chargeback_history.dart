
import 'package:flutter/material.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:http/http.dart' as http;
class chargeback extends StatefulWidget {
  chargeback({Key key}) : super(key: key);

  @override
  _chargebackState createState() => _chargebackState();
}

class _chargebackState extends State<chargeback> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
        
              title: Text('CHARGEBACK HISTORY',style: TextStyle(fontSize: 15),),
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
      ),
          body: FutureBuilder(
            future:http.get(
global.APIEndPoints.chargebackEndPoint,
headers: {

'Accept':'application/json',
'Content-Type':'application/json',
'Authorization':userToken


}

            ).then((value) => value) ,
            builder: (context, snapshot) {

print(snapshot.data.body.toString());
              return Center(child: Text("No Data to show"));
            }
          ),
    );
  }
}