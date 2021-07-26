import 'package:app_example/view/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const ROUTE = '/';

  @override
  get binds => [];

  @override
  get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
      ];
}
