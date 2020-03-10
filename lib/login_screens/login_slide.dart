import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const List<String> images = [
  "assets/slide.png",
  "assets/slide.png",
  "assets/slide.png",
];

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
      ..init(context);
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
                          color: Color(0xFFe5f1fb),
                          activeColor: Colors.blue,
                          size: 8.0,
                          activeSize: 8.0)),
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
                height: ScreenUtil.getInstance().setHeight(20),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'MORE DETAILS',
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
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                  bottomRight: Radius.circular(4.0),
                ),
                child:Image.asset(
                  "assets/slide.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              width: ScreenUtil.getInstance().setWidth(160),
            )

          ),
        )

      ],
    );
  }
}

