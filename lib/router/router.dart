import 'package:flutter_practice/features/crypto_coin/crypto_coin.dart';
import 'package:flutter_practice/features/crypto_favorites/screens/crypto_favorites_screen.dart';
import 'package:flutter_practice/features/crypto_list/crypto_list.dart';
import 'package:flutter_practice/features/crypto_settings/screens/crypto_settings_screen.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
  '/favorites': (context) => const CryptoFavoritesScreen(),
  '/settings': (context) => const CryptoSettingsScreen(),
};
