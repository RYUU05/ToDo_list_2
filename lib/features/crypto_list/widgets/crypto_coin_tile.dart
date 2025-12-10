import 'package:flutter/material.dart';
import 'package:flutter_practice/repositories/crypto_coin/models/crypto_coin.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(coin.imgUrl),
      title: Text(coin.name, style: TextStyle(color: Colors.white)),
      subtitle: Text(
        '${coin.priceInUSD}\$',
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
      onTap: () {
        Navigator.of(context).pushNamed('/coin', arguments: coin);
      },
    );
  }
}
