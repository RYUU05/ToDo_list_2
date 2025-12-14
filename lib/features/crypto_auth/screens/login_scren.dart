import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_auth/widgets/Txt_fild.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class LoginScren extends StatelessWidget {
  final TextEditingController emal = TextEditingController();
  final TextEditingController paswd = TextEditingController();

  void login() async {
    await authRepo.value.signIn(email: emal.text, password: paswd.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 31, 31, 31)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/icon.png"),
              TxtFild(label: "Email", controller: emal),
              TxtFild(label: "Password", controller: paswd),
              ElevatedButton(
                onPressed: () {
                  login();
                  Navigator.pushNamed(context, '/coinlist');
                },
                child: Text("Login"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
