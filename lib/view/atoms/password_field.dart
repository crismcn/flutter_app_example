import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;

  const PasswordField({
    this.controller,
    this.labelText = '',
    this.validator,
  });

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _hidePassword = true;

  @override
  build(_) => TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      obscureText: _hidePassword,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: _toggleHidePassword,
          icon: Icon(_hidePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey),
        ),
      ));

  void _toggleHidePassword() => setState(() => _hidePassword = !_hidePassword);
}
