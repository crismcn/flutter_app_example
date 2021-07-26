import 'package:app_example/api/enterprise_repository.dart';
import 'package:app_example/logic/home_searching_store.dart';
import 'package:app_example/view/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  static const ROUTE = '/home';

  @override
  get binds => [
        Bind.singleton((i) => EnterpriseRepository(i.get())),
        Bind.singleton((i) => HomeSearchingStore(i.get())),
      ];

  @override
  get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
      ];
}
