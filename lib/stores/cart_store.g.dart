// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  late final _$cartAtom = Atom(name: '_CartStore.cart', context: context);

  @override
  Map<String, int> get cart {
    _$cartAtom.reportRead();
    return super.cart;
  }

  @override
  set cart(Map<String, int> value) {
    _$cartAtom.reportWrite(value, super.cart, () {
      super.cart = value;
    });
  }

  late final _$totalItemsAtom =
      Atom(name: '_CartStore.totalItems', context: context);

  @override
  int get totalItems {
    _$totalItemsAtom.reportRead();
    return super.totalItems;
  }

  @override
  set totalItems(int value) {
    _$totalItemsAtom.reportWrite(value, super.totalItems, () {
      super.totalItems = value;
    });
  }

  late final _$cartTotalAtom =
      Atom(name: '_CartStore.cartTotal', context: context);

  @override
  int get cartTotal {
    _$cartTotalAtom.reportRead();
    return super.cartTotal;
  }

  @override
  set cartTotal(int value) {
    _$cartTotalAtom.reportWrite(value, super.cartTotal, () {
      super.cartTotal = value;
    });
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void emptyCart() {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.emptyCart');
    try {
      return super.emptyCart();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic calCartTotal() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.calCartTotal');
    try {
      return super.calCartTotal();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(String itemID) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addItem');
    try {
      return super.addItem(itemID);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String itemID) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.removeItem');
    try {
      return super.removeItem(itemID);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseItemCount(String itemID) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.increaseItemCount');
    try {
      return super.increaseItemCount(itemID);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseItemCount(String itemID) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.decreaseItemCount');
    try {
      return super.decreaseItemCount(itemID);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cart: ${cart},
totalItems: ${totalItems},
cartTotal: ${cartTotal}
    ''';
  }
}
