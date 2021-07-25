import 'package:flutter/material.dart';
import 'package:app_example/utils/ui_texts.dart';
import 'package:app_example/view/atoms/password_field.dart';
import 'package:app_example/view/template/splash_login_template.dart';

class LoginPage extends StatelessWidget {
  static const ROUTE = '/';

  @override
  build(_) => SplashLoginTemplate(children: [
        Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: UITexts.emailLabelText,
                  ),
                ),
              ),
              PasswordField(
                labelText: UITexts.passwordLabelText,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: TextButton(
                  child: Text(UITexts.signinButton),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ]);
}
