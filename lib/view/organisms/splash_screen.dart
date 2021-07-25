import 'package:app_example/utils/asset_paths.dart';
import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/utils/ui_theme.dart';
import 'package:app_example/view/atoms/animated_image_height.dart';
import 'package:app_example/view/atoms/animated_visibility_column.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final double height;
  final CustomClipper<Path> clipper;
  final bool isSplashTime;

  const SplashScreen({
    required this.height,
    required this.clipper,
    required this.isSplashTime,
  });

  @override
  build(_) => Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: height < UI.screenHeight ? clipper : null,
              child: AnimatedImageHeight(
                height: height,
                imagePath: ImagePaths.splashBackground,
                duration: Duration(milliseconds: 750),
              ),
            ),
          ),
          if (isSplashTime)
            Center(child: Image.asset(ImagePaths.logotypeWhite)),
          Positioned(
            top: 0,
            child: AnimatedVisibilityColumn(
              visible: isSplashTime,
              duration: Duration(milliseconds: 500),
              children: [
                SizedBox(height: height * .35),
                Image.asset(ImagePaths.logoiconWhite),
                Text('\n${UITexts.loginWelcomeTitle}',
                    style: Theme.of(_).primaryTextTheme.headline1),
              ],
            ),
          ),
        ],
      );
}
