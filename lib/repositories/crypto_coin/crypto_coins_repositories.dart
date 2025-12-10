import 'package:dio/dio.dart';
import 'package:flutter_practice/repositories/crypto_coin/models/crypto_coin.dart';

class CryptoCoinsRepositories {
  Future<List<CryptoCoin>> getCoinsList() async {
    final responce = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD',
    );
    final data = responce.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final name = usdData['FROMSYMBOL'];
      final imgUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: name,
        priceInUSD: price,
        imgUrl: 'https://www.cryptocompare.com/$imgUrl',
      );
    }).toList();
    return cryptoCoinsList;
  }
}
