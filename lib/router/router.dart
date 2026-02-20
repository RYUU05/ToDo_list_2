import 'package:flutter_practice/Authlayout.dart';
import 'package:flutter_practice/features/crypto_auth/screens/login_scren.dart';
import 'package:flutter_practice/features/crypto_auth/screens/register.dart';
import 'package:flutter_practice/features/crypto_coin/crypto_coin.dart';
import 'package:flutter_practice/features/crypto_favorites/screens/crypto_favorites_screen.dart';
import 'package:flutter_practice/features/crypto_list/crypto_list.dart';
import 'package:flutter_practice/features/crypto_settings/screens/crypto_settings_screen.dart';

final routes = {
  '/': (context) => Authlayout(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => Register(),
  '/coinlist': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
  '/favorites': (context) => const Favorit(),
  '/settings': (context) => const CryptoSettingsScreen(),
};
