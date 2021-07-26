import 'package:app_example/utils/asset_paths.dart';
import 'package:app_example/view/atoms/animated_image_height.dart';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground(this.showOrnaments, {required this.height});
  final bool showOrnaments;
  final double height;

  @override
  build(_) => Stack(children: [
        AnimatedImageHeight(
          duration: Duration(milliseconds: 350),
          height: height,
          imagePath: ImagePaths.splashBackground,
        ),
        if (showOrnaments)
          Positioned(
            left: -20,
            top: height * .65,
            child: _TransLogo(15, height * .7),
          ),
        if (showOrnaments)
          Positioned(
            top: -20,
            left: height * .35,
            child: _TransLogo(225, height * 1.25),
          ),
        if (showOrnaments)
          Positioned(
            right: 10,
            top: height * .65,
            child: _TransLogo(180, height * .7),
          ),
      ]);
}

class _TransLogo extends StatelessWidget {
  const _TransLogo(this.degree, this.width);
  final int degree;
  final double width;

  @override
  build(_) => Opacity(
      opacity: .15,
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(degree / 360),
        child: Image.asset(ImagePaths.logoiconWhite,
            width: width, fit: BoxFit.contain),
      ));
}
