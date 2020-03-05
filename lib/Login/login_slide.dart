import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> images = [
  "assets/slide.png",
  "assets/slide.png",
  "assets/slide.png",
];

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 40.0, right: 40.0),
            child: new Stack(
              children: <Widget>[
                ConstrainedBox(
                  constraints: new BoxConstraints.expand(),
                ),
                new Swiper.children(
                  autoplay: true,
                  pagination: new SwiperPagination(
                      margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                      builder: new DotSwiperPaginationBuilder(
                          color: Colors.blueGrey,
                          activeColor: Colors.blue,
                          size: 8.0,
                          activeSize: 10.0)),
                  children: <Widget>[
                    _getSlide(),
                    _getSlide(),
                    _getSlide(),
                  ],
                )
              ],
            ),
        ),
    );
  }

  Widget _getSlide(){
    return new Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Lorem ipsum dolor sit amet, con sectetur adipiscing elit. Integer suscipit elit eget odio vestib.',
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'DETAYLI BİLGİ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              child:Image.asset(
                "assets/slide.png",
                fit: BoxFit.fitWidth,
              ),
            ),

          ),
        )

      ],
    );
  }
}

