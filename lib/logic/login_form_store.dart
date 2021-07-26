import 'package:app_example/api/login_repository.dart';
import 'package:app_example/routers/home_module.dart';
import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/view/atoms/password_field.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_form_store.g.dart';

class LoginFormStore = _LoginFormStoreBase with _$LoginFormStore;

abstract class _LoginFormStoreBase with Store {
  _LoginFormStoreBase(this.repo);
  final LoginRepository repo;
  final loginFormKey = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordFieldState = GlobalKey<PasswordFieldState>();

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;
  void startLoading() => setLoading(true);
  void stopLoading() => setLoading(false);

  Future<void> formHandler() async {
    startLoading();

    if (loginFormKey.currentState!.validate()) {
      final res = await repo.signin(
        user: userTextController.text,
        password: passwordTextController.text,
      );

      switch (res['code']) {
        case 200:
          Modular.to.navigate(HomeModule.ROUTE);
          break;
        case 401:
          stopLoading();
          passwordFieldState.currentState!
              .updateError(UITexts.invalidCredentials);
          Future.delayed(Duration(seconds: 5),
              () => passwordFieldState.currentState!.updateError(null));
          break;
        default:
          stopLoading();
          passwordFieldState.currentState!
              .updateError(UITexts.somethingGoWrong);
          Future.delayed(Duration(seconds: 5),
              () => passwordFieldState.currentState!.updateError(null));
          break;
      }
    }

    stopLoading();
  }
}
