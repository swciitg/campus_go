// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$viewTypeAtom =
      Atom(name: '_UserStore.viewType', context: context);

  @override
  ViewType get viewType {
    _$viewTypeAtom.reportRead();
    return super.viewType;
  }

  @override
  set viewType(ViewType value) {
    _$viewTypeAtom.reportWrite(value, super.viewType, () {
      super.viewType = value;
    });
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setViewType(ViewType v) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setViewType');
    try {
      return super.setViewType(v);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
viewType: ${viewType}
    ''';
  }
}
