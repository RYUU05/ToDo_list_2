import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthRepositories> authRepo = ValueNotifier(AuthRepositories());

final firestor = FirebaseFirestore.instance;

class AuthRepositories {
  final FirebaseAuth firebasauth = FirebaseAuth.instance;
  User? get currentuser => firebasauth.currentUser;
  Stream<User?> get authstatechange => firebasauth.authStateChanges();

  Future<UserCredential> signIn({required email, required password}) async {
    return await firebasauth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAcc({required email, required password}) async {
    UserCredential userCred = await firebasauth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCred.user?.sendEmailVerification();

    await firebasauth.signOut();

    return userCred;
  }

  Future<void> signOut() async {
    await firebasauth.signOut();
  }

  bool isEmailVerified() {
    return firebasauth.currentUser?.emailVerified ?? false;
  }

  Future<void> reloadUser() async {
    await firebasauth.currentUser?.reload();
  }
}
