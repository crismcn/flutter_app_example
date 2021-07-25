import 'package:app_example/utils/ui_theme.dart';
import 'package:app_example/view/organisms/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashLoginTemplate extends StatefulWidget {
  final List<Widget> children;

  const SplashLoginTemplate({this.children = const []});

  @override
  _SplashLoginTemplateState createState() => _SplashLoginTemplateState();
}

class _SplashLoginTemplateState extends State<SplashLoginTemplate> {
  bool _isSplashTime = true;
  double _splashHeight = UI.screenHeight;

  @override
  initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
      () => setState(() {
        _isSplashTime = false;
        _splashHeight = UI.screenHeight * .35;
      }),
    );
  }

  @override
  build(_) => Scaffold(
      backgroundColor: _isSplashTime ? Colors.pinkAccent[700] : Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: _splashHeight,
            child: AnimatedOpacity(
              opacity: _isSplashTime ? 0 : 1,
              duration: Duration(milliseconds: 1500),
              child: Container(
                height: UI.screenHeight - _splashHeight,
                width: MediaQuery.of(_).size.width,
                child: ListView(
                  padding: EdgeInsets.all(12),
                  children: widget.children,
                ),
              ),
            ),
          ),
          SplashScreen(
            height: _splashHeight,
            clipper: _Clipper(),
            isSplashTime: _isSplashTime,
          ),
        ],
      ));
}

class _Clipper extends CustomClipper<Path> {
  @override
  getClip(size) {
    final path = Path();

    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 40,
    );
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  shouldReclip(oldClipper) => false;
}
