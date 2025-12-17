import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_auth/widgets/Txt_fild.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class Register extends StatelessWidget {
  final TextEditingController emal = TextEditingController();
  final TextEditingController paswd = TextEditingController();

  void register(BuildContext context) async {
    try {
      await authRepo.value.createAcc(email: emal.text, password: paswd.text);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Check Your Email'),
          content: Text('We sent a verification link to ${emal.text}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: const Color.fromARGB(255, 31, 31, 31)),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/icon.png",
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
              TxtFild(label: "email", controller: emal, hintTxt: "Enter Email"),
              SizedBox(height: 15),
              TxtFild(
                label: "Password",
                controller: paswd,
                hintTxt: "Enter Password",
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  register(context);
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
