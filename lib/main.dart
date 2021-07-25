import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'utils/ui_theme.dart';
import 'routers/login_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(
      module: AppModule(),
      child: MaterialApp(
        initialRoute: _initialRoute,
        theme: UI.globalTheme,
      ).modular()));
}

class AppModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
        ModuleRoute(_initialRoute, module: LoginModule()),
      ];
}

String get _initialRoute => '/';
