import 'package:app_example/utils/ui_theme.dart';
import 'package:app_example/view/atoms/custom_loading.dart';
import 'package:app_example/view/organisms/splash_screen.dart';

import 'package:flutter/material.dart';

class SplashLoginTemplate extends StatefulWidget {
  const SplashLoginTemplate({
    this.children = const [],
    this.showLoading = false,
  });
  final List<Widget> children;
  final bool showLoading;
  @override
  _SplashLoginTemplateState createState() => _SplashLoginTemplateState();
}

class _SplashLoginTemplateState extends State<SplashLoginTemplate> {
  bool _isSplashTime = true;
  double _splashHeight = UI.screenHeight;

  bool isKeyboardActive(BuildContext _) =>
      MediaQuery.of(_).viewInsets.bottom != 0.0;

  @override
  initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => setState(() {
        _isSplashTime = false;
        _splashHeight = UI.screenHeight * .35;
      }),
    );
  }

  @override
  build(_) => Scaffold(
      backgroundColor: _isSplashTime ? Colors.pinkAccent[700] : Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        Positioned(
          top: _splashHeight,
          child: AnimatedOpacity(
            opacity: _isSplashTime ? 0 : 1,
            duration: Duration(milliseconds: 1500),
            child: FocusScope(
              child: Focus(
                onFocusChange: (hasFocus) => hasFocus
                    ? setState(() => _splashHeight = UI.screenHeight * .15)
                    : setState(() => _splashHeight = UI.screenHeight * .35),
                child: Container(
                  height: UI.screenHeight - _splashHeight,
                  width: MediaQuery.of(_).size.width,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(12),
                    children: widget.children,
                  ),
                ),
              ),
            ),
          ),
        ),
        SplashScreen(
          height: _splashHeight,
          clipper: _Clipper(),
          isSplashTime: _isSplashTime,
          isKeyboardActive: MediaQuery.of(_).viewInsets.bottom != 0.0,
        ),
        if (widget.showLoading) CustomLoading(shadow: true),
      ]));
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
