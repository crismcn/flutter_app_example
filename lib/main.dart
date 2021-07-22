import 'package:flutter/material.dart';
import 'utils/asset_paths.dart';

void main() => runApp(FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 2500)),
      builder: (context, snapshot) =>
          (snapshot.connectionState == ConnectionState.waiting)
              ? MaterialApp(home: Splash())
              : MaterialApp(home: Container(color: Colors.amberAccent)),
    ));

class Splash extends StatelessWidget {
  @override
  build(_) => Scaffold(
        backgroundColor: Colors.pink[400],
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(ImagePaths.splashBackground, fit: BoxFit.fill),
          Center(child: Image.asset(ImagePaths.logotypeWhite)),
        ]),
      );
}
