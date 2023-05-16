import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
part 'auth_service.g.dart';

class AuthService = _AuthServiceBase with _$AuthService;

abstract class _AuthServiceBase with Store {
  _AuthServiceBase() {
    _authCheck();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  bool isLoading = true;

  @observable
  User? myUser;

  @action
  void _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      myUser = user;
      isLoading = false;
    });
  }

  @action
  void _getUser() {
    myUser = _auth.currentUser;
  }

  Future<void> register(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('erro ao registrar-se: $e'),
        ),
      );
    }
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _getUser();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('erro ao logar-se: $e'),
        ),
      );
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _getUser();
  }
}
