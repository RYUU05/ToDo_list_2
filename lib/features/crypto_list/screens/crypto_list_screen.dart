import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_practice/repositories/crypto_coin/crypto_coins_repositories.dart';
import 'package:flutter_practice/repositories/crypto_coin/models/crypto_coin.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        title: Text(
          'CryptoCurrenciesList',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: (_cryptoCoinsList == null)
          ? SizedBox()
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: _cryptoCoinsList!.length,
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];
                return CryptoCoinTile(coin: coin);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _cryptoCoinsList = await CryptoCoinsRepositories().getCoinsList();
          setState(() {});
        },
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
      ),
    );
  }
}
