import 'package:flutter/material.dart';
import 'package:flutter_practice/router/router.dart';

class CryptoCurrienciesListApp extends StatelessWidget {
  const CryptoCurrienciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoCurrenciesList',
      routes: routes,
    );
  }
}
