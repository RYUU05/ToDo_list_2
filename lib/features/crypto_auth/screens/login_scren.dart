import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_auth/widgets/Txt_fild.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class LoginScren extends StatelessWidget {
  final TextEditingController emal = TextEditingController();
  final TextEditingController paswd = TextEditingController();

  void login(BuildContext context) async {
    try {
      await authRepo.value.signIn(email: emal.text, password: paswd.text);

      var user = authRepo.value.firebasauth.currentUser;
      await user?.reload();
      user = authRepo.value.firebasauth.currentUser;

      if (user?.emailVerified == true) {
        Navigator.pushNamed(context, '/coinlist');
      } else {
        await authRepo.value.firebasauth.signOut();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Email Not Verified'),
            content: Text('Please verify your email first'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Wrong email or password'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/icon.png",
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
              TxtFild(label: "Email", controller: emal, hintTxt: "Enter Email"),
              SizedBox(height: 15),
              TxtFild(
                label: "Password",
                controller: paswd,
                hintTxt: "Enter Password",
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  login(context);
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
