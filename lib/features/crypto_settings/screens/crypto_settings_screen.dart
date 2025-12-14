import 'package:flutter/material.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class CryptoSettingsScreen extends StatefulWidget {
  const CryptoSettingsScreen({super.key});

  @override
  State<CryptoSettingsScreen> createState() => _CryptoSettingsScreenState();
}

class _CryptoSettingsScreenState extends State<CryptoSettingsScreen> {
  void logout() async {
    await authRepo.value.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("User email:   "),
                Text(authRepo.value.currentuser?.email ?? " "),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () async {
                logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
