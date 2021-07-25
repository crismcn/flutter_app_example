import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'utils/ui_theme.dart';
import 'view/pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(
      module: AppModule(),
      child: MaterialApp(
        initialRoute: '/',
        theme: UI.globalTheme,
      ).modular()));
}

class AppModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
        ChildRoute(LoginPage.ROUTE, child: (_, args) => LoginPage()),
      ];
}
