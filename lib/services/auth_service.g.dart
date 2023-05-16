// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthService on _AuthServiceBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AuthServiceBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$myUserAtom =
      Atom(name: '_AuthServiceBase.myUser', context: context);

  @override
  User? get myUser {
    _$myUserAtom.reportRead();
    return super.myUser;
  }

  @override
  set myUser(User? value) {
    _$myUserAtom.reportWrite(value, super.myUser, () {
      super.myUser = value;
    });
  }

  late final _$_AuthServiceBaseActionController =
      ActionController(name: '_AuthServiceBase', context: context);

  @override
  void _authCheck() {
    final _$actionInfo = _$_AuthServiceBaseActionController.startAction(
        name: '_AuthServiceBase._authCheck');
    try {
      return super._authCheck();
    } finally {
      _$_AuthServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _getUser() {
    final _$actionInfo = _$_AuthServiceBaseActionController.startAction(
        name: '_AuthServiceBase._getUser');
    try {
      return super._getUser();
    } finally {
      _$_AuthServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
myUser: ${myUser}
    ''';
  }
}
