import 'package:flutter/material.dart';
import 'package:flutter_practice/Apploading.dart';
import 'package:flutter_practice/features/crypto_auth/screens/login_scren.dart';
import 'package:flutter_practice/features/crypto_list/crypto_list.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class Authlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authRepo,
      builder: (context, authRepo, child) {
        return StreamBuilder(
          stream: authRepo.authstatechange,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = Apploading();
            } else if (snapshot.hasData) {
              widget = CryptoListScreen();
            } else {
              widget = LoginScreen();
            }
            return widget;
          },
        );
      },
    );
  }
}
