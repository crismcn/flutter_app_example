import 'package:app_example/routers/home_module.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_form_store.g.dart';

class LoginFormStore = _LoginFormStoreBase with _$LoginFormStore;

abstract class _LoginFormStoreBase with Store {
  final loginFormKey = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @observable
  bool loading = false;
  @action
  void setLoading(bool value) => loading = value;
  void startLoading() => setLoading(true);
  void stopLoading() => setLoading(false);

  Future<void> formHandler() async {
    startLoading();
    Future.delayed(Duration(seconds: 2), () {
      stopLoading();
      Modular.to.navigate(HomeModule.ROUTE);
    });
  }
}
