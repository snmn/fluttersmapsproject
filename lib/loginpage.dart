import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportsconnectflutter/home.dart';
import 'package:sportsconnectflutter/static.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}
class LoginPageState extends State<LoginPage>{
  static List<Widget> widgets = [];
  int _current=0;

 static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  void initState() {
    super.initState();

  }

  final List child = map<Widget>(
    StaticValue.imgList,
        (index, i) {
      return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(3.0),
            child:Column(
            children: <Widget>[
          ClipRRect(
          borderRadius: new BorderRadius.circular(0),
          child: Image(image: new AssetImage(i),height: 560,width: 500,fit: BoxFit.cover,)),

          ],
            ),
          ),
        ],
      );
    },
  ).toList();
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: size.height,
      width: size.width,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0.0, 0.0),
          colors: [const Color(0xff009E64),  const Color(0xff67B26F),const Color(0xff67B26F)], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Column(children: [
        CarouselSlider(
          items: child,
          autoPlay: true,
          height: size.height/1.35,
          aspectRatio: 0.5,
          viewportFraction: 1.0,
          autoPlayInterval: Duration(seconds: 10),
          enlargeCenterPage: false,
          // aspectRatio: 2.20,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            StaticValue.imgList,
                (index, url) {
              return Container(
                width: 5.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
            },
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context) => Home()));
          },
          child: Container(
            margin: EdgeInsets.only(left: 50,right: 50,top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment(0.0, 0.0),
                colors: [const Color(0xff2C5364),const Color(0xff203A43) ,const Color(0xffB22000)], // whitish to gray
                tileMode: TileMode.clamp, // repeats the gradient over the canvas
              ),
            ),

            padding: EdgeInsets.only(left:15,right: 15,top: 18,bottom: 18),
            child: Center(child: Text("Continue with Facebook",style: TextStyle(decoration: TextDecoration.none,color: Colors.white,fontSize: 17,fontWeight: FontWeight.w800,fontFamily: 'JosefinSans'),)),
          ),
        ),

      ])
    );
  }

}