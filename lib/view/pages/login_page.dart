import 'package:app_example/logic/login_form_store.dart';
import 'package:app_example/utils/validators.dart';
import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/view/atoms/password_field.dart';
import 'package:app_example/view/template/splash_login_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  final _store = Modular.get<LoginFormStore>();

  @override
  build(_) => Observer(
        builder: (_) =>
            SplashLoginTemplate(showLoading: _store.loading, children: [
          Form(
            key: _store.loginFormKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 28),
                    child: TextFormField(
                      controller: _store.userTextController,
                      validator: InputValidators.emailIsValid,
                      decoration: InputDecoration(
                        labelText: UITexts.emailLabelText,
                      ),
                    ),
                  ),
                  PasswordField(
                    key: _store.passwordFieldState,
                    controller: _store.passwordTextController,
                    labelText: UITexts.passwordLabelText,
                    validator: InputValidators.passwordIsValid,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    child: TextButton(
                      child: Text(UITexts.signinButton.toUpperCase()),
                      onPressed: _store.formHandler,
                    ),
                  ),
                ]),
          ),
        ]),
      );
}
