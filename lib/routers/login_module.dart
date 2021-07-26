import 'package:app_example/api/login_repository.dart';
import 'package:app_example/logic/login_form_store.dart';
import 'package:app_example/view/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  static const ROUTE = '/login';

  @override
  get binds => [
        Bind.singleton((i) => LoginRepository(i.get())),
        Bind.singleton((i) => LoginFormStore(i.get())),
      ];

  @override
  get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];
}
