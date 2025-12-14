import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_auth/widgets/Txt_fild.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class Register extends StatelessWidget {
  final TextEditingController emal = TextEditingController();
  final TextEditingController paswd = TextEditingController();
  void register() async {
    await authRepo.value.createAcc(email: emal.text, password: paswd.text);
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
              TxtFild(label: "email", controller: emal),
              TxtFild(label: "Password", controller: paswd),
              ElevatedButton(
                onPressed: () async {
                  register();
                  Navigator.pushNamed(context, '/coinlist');
                },
                child: Text("Register"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text("Login"),
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
