import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

ValueNotifier<AuthRepositories> authRepo = ValueNotifier(AuthRepositories());

final firestore = FirebaseFirestore.instance;

class AuthRepositories {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentuser => firebaseAuth.currentUser;
  Stream<User?> get authstatechange => firebaseAuth.authStateChanges();

  Future<UserCredential> signIn({required email, required password}) async {
    return await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createAcc({required email, required password}) async {
    UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCred.user?.sendEmailVerification();

    await firebaseAuth.signOut();

    return userCred;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  bool isEmailVerified() {
    return firebaseAuth.currentUser?.emailVerified ?? false;
  }

  Future<void> reloadUser() async {
    await firebaseAuth.currentUser?.reload();
  }
}
