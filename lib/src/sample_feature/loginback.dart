// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

import '/utils/arc_clipper.dart';
import '/utils/uidata.dart';

class LoginBackground extends StatelessWidget {
  final showIcon;
  final image;
  LoginBackground({this.showIcon = true, this.image});

  Widget topHalf(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final double _height = 150;
    var deviceSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
            height: 150,
            child: Stack(children: [
              ClipPath(
                clipper: ShapeClipper([
                  Offset(width / 5, _height),
                  Offset(width / 10 * 5, _height - 60),
                  Offset(width / 5 * 4, _height + 20),
                  Offset(width, _height - 18)
                ]),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0),
                          Color.fromARGB(255, 120, 255, 129).withOpacity(1),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
              ),
              ClipPath(
                clipper: ShapeClipper([
                  Offset(width / 3, _height + 20),
                  Offset(width / 10 * 8, _height - 60),
                  Offset(width / 5 * 4, _height - 60),
                  Offset(width, _height - 20)
                ]),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 120, 255, 129).withOpacity(1),
                          Color.fromARGB(255, 120, 255, 129).withOpacity(0.4),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                ),
              ),
              ClipPath(
                clipper: ShapeClipper([
                  Offset(width / 5, _height),
                  Offset(width / 2, _height - 40),
                  Offset(width / 5 * 4, _height - 80),
                  Offset(width, _height - 20)
                ]),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          //   Color.fromARGB(255, 255, 227, 125),
                          //  Color.fromARGB(255, 246, 196, 12),
                          Color.fromARGB(255, 245, 250, 255),
                          Color.fromARGB(255, 255, 255, 255),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.95, 0.0),
                        stops: const [0, 0.9],
                        tileMode: TileMode.clamp),
                  ),
                ),
              ),
            ])),
      ],
    );
  }

  final bottomHalf = new Flexible(
    flex: 2,
    child: new Container(),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 9, 23) ,
      body: Column(
        children: <Widget>[topHalf(context), bottomHalf],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
