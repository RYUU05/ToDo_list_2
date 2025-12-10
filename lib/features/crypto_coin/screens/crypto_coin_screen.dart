import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'U must provide String args');
    coinName = args as String;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        title: Text(
          coinName ?? '...',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Text(coinName ?? '...'),
    );
  }
}
