import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({this.labelText = ''});
  final String labelText;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _hidePassword = true;
  void _toggleHidePassword() => setState(() => _hidePassword = !_hidePassword);

  @override
  build(_) => TextFormField(
        obscureText: _hidePassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: IconButton(
            onPressed: _toggleHidePassword,
            icon: Icon(
              _hidePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ),
      );
}
