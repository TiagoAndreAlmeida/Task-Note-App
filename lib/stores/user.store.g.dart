// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$userAtom = Atom(name: '_UserStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserEmail(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserEmail');
    try {
      return super.setUserEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserPassword(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUserPassword');
    try {
      return super.setUserPassword(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submit() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.submit');
    try {
      return super.submit();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}