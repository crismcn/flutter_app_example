// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_searching_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeSearchingStore on _HomeSearchingStoreBase, Store {
  Computed<List<Enterprise>?>? _$enterprisesComputed;

  @override
  List<Enterprise>? get enterprises => (_$enterprisesComputed ??=
          Computed<List<Enterprise>?>(() => super.enterprises,
              name: '_HomeSearchingStoreBase.enterprises'))
      .value;

  final _$asyncEnterprisesAtom =
      Atom(name: '_HomeSearchingStoreBase.asyncEnterprises');

  @override
  ObservableFuture<Map<String, dynamic>>? get asyncEnterprises {
    _$asyncEnterprisesAtom.reportRead();
    return super.asyncEnterprises;
  }

  @override
  set asyncEnterprises(ObservableFuture<Map<String, dynamic>>? value) {
    _$asyncEnterprisesAtom.reportWrite(value, super.asyncEnterprises, () {
      super.asyncEnterprises = value;
    });
  }

  final _$_HomeSearchingStoreBaseActionController =
      ActionController(name: '_HomeSearchingStoreBase');

  @override
  void fetchEnterprises() {
    final _$actionInfo = _$_HomeSearchingStoreBaseActionController.startAction(
        name: '_HomeSearchingStoreBase.fetchEnterprises');
    try {
      return super.fetchEnterprises();
    } finally {
      _$_HomeSearchingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
asyncEnterprises: ${asyncEnterprises},
enterprises: ${enterprises}
    ''';
  }
}
