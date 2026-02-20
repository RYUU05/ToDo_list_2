import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_auth/widgets/Txt_fild.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => _isLoading = true);

    try {
      await authRepo.value.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      var user = authRepo.value.firebasauth.currentUser;
      await user?.reload();
      user = authRepo.value.firebasauth.currentUser;

      if (!mounted) return;

      if (user?.emailVerified == true) {
        Navigator.pushNamed(context, '/coinlist');
      } else {
        await authRepo.value.firebasauth.signOut();

        if (!mounted) return;

        _showDialog(
          title: 'Email Not Verified',
          content: 'Please verify your email first',
        );
      }
    } catch (e) {
      if (!mounted) return;

      _showDialog(title: 'Login Failed', content: 'Wrong email or password');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showDialog({required String title, required String content}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color.fromARGB(255, 31, 31, 31)),
        child: SingleChildScrollView(
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
                TxtFild(
                  label: "Email",
                  controller: _emailController,
                  hintTxt: "Enter Email",
                ),
                const SizedBox(height: 15),
                TxtFild(
                  label: "Password",
                  controller: _passwordController,
                  hintTxt: "Enter Password",
                ),
                const SizedBox(height: 50),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: const Text("Login"),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
