import 'package:app_example/logic/login_form_store.dart';
import 'package:app_example/view/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  get binds => [
        Bind.singleton((i) => LoginFormStore()),
      ];

  @override
  get routes => [
        ChildRoute(LoginPage.ROUTE, child: (_, args) => LoginPage()),
      ];
}
