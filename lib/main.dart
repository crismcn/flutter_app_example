import 'package:app_example/utils/ui_theme.dart';
import 'package:flutter/material.dart';
import 'utils/asset_paths.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(FutureBuilder(
    future: Future.delayed(Duration(milliseconds: 2500)),
    builder: (context, snapshot) =>
        (snapshot.connectionState == ConnectionState.waiting)
            ? MaterialApp(home: Splash())
            : ModularApp(
                module: AppModule(),
                child: MaterialApp(
                  initialRoute: '/',
                  theme: UI.globalTheme,
                ).modular())));

class Splash extends StatelessWidget {
  @override
  build(_) => Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(ImagePaths.splashBackground, fit: BoxFit.fill),
          Center(child: Image.asset(ImagePaths.logotypeWhite)),
        ]),
      );
}

class AppModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
        ChildRoute('/', child: (_, args) => Container(color: Colors.blueGrey)),
      ];
}
