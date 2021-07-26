import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'utils/ui_theme.dart';
import 'routers/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(
      module: AppModule(),
      child: MaterialApp(
        initialRoute: LoginModule.ROUTE,
        theme: UI.globalTheme,
      ).modular()));
}

class AppModule extends Module {
  @override
  get binds => [];

  @override
  get routes => [
        ModuleRoute(LoginModule.ROUTE, module: LoginModule()),
        ModuleRoute(HomeModule.ROUTE, module: HomeModule()),
      ];
}
