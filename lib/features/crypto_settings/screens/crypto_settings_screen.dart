import 'package:flutter/material.dart';
import 'package:flutter_practice/features/widgets/nav_bar.dart';
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

  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("User email:   ", style: TextStyle(color: Colors.white)),
              Text(
                authRepo.value.currentuser?.email ?? " ",
                style: TextStyle(color: Colors.white),
              ),
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
              foregroundColor: Colors.white,
              fixedSize: Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text("Sign out", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(currentIndex: currentIndex),
    );
  }
}
