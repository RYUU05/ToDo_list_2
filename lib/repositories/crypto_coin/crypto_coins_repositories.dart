import 'package:dio/dio.dart';
import 'package:flutter_practice/repositories/crypto_coin/models/crypto_coin.dart';

class CryptoCoinsRepositories {
  Future<List<CryptoCoin>> getCoinsList(List<String> symbols) async {
    var symbolsString = symbols.join(',');

    var responce = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$symbolsString&tsyms=USD',
    );

    var data = responce.data as Map<String, dynamic>;
    var dataRaw = data['RAW'] as Map<String, dynamic>;

    List<CryptoCoin> cryptoCoinsList = dataRaw.entries.map((e) {
      var usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      var price = usdData['PRICE'] as num;
      var name = usdData['FROMSYMBOL'];
      var imgUrl = usdData['IMAGEURL'];
      var high24h = usdData['HIGH24HOUR'] as num;
      var low24h = usdData['LOW24HOUR'] as num;

      return CryptoCoin(
        name: name,
        priceInUSD: double.parse(price.toStringAsFixed(2)),
        imgUrl: 'https://www.cryptocompare.com/$imgUrl',
        high24h: double.parse(high24h.toStringAsFixed(2)),
        low24h: double.parse(low24h.toStringAsFixed(2)),
      );
    }).toList();

    return cryptoCoinsList;
  }
}
