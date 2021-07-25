// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginFormStore on _LoginFormStoreBase, Store {
  final _$loadingAtom = Atom(name: '_LoginFormStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_LoginFormStoreBaseActionController =
      ActionController(name: '_LoginFormStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_LoginFormStoreBaseActionController.startAction(
        name: '_LoginFormStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
