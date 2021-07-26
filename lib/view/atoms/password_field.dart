import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;

  const PasswordField({
    Key? key,
    this.controller,
    this.labelText = '',
    this.validator,
  }) : super(key: key);

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _hidePassword = true;
  String? error;

  updateError(String? err) => setState(() => error = err);

  @override
  build(_) => TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        errorText: error,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: _toggleHidePassword,
          icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey),
        ),
      ));

  void _toggleHidePassword() => setState(() => _hidePassword = !_hidePassword);
}
