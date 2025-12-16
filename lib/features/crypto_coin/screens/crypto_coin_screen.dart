import 'package:flutter/material.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';
import 'package:flutter_practice/repositories/crypto_coin/models/crypto_coin.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? coin;
  bool isfavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
      args != null && args is CryptoCoin,
      'U must provide CryptoCoin as args',
    );

    coin = args as CryptoCoin;
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    var userId = authRepo.value.currentuser?.uid;
    if (userId != null && coin != null) {
      var doc = await firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(coin!.name)
          .get();
      if (doc.exists) {
        setState(() {
          isfavorite = true;
        });
      }
    }
  }

  void toggleFavorite() async {
    var userId = authRepo.value.currentuser?.uid;
    if (userId == null || coin == null) return;

    var favRef = firestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .doc(coin!.name);

    if (isfavorite) {
      await favRef.delete();
      setState(() {
        isfavorite = false;
      });
    } else {
      await favRef.set({
        'name': coin!.name,
        'priceInUSD': coin!.priceInUSD,
        'imageUrl': coin!.imgUrl,
      });
      setState(() {
        isfavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
        title: Text(
          coin?.name ?? '...',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isfavorite ? Icons.favorite : Icons.favorite_border,
              color: isfavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              toggleFavorite();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.network(
                coin?.imgUrl ?? '',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Price now: ${coin?.priceInUSD}\$',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Highest price last 24 hr: ${coin?.high24h}\$',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'Lowest orice last 24 hr: ${coin?.low24h}\$',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
