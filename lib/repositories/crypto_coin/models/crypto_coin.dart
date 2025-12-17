class CryptoCoin {
  CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imgUrl,
    required this.high24h,
    required this.low24h,
  });
  final String name;
  final double priceInUSD;
  final String imgUrl;
  final double high24h;
  final double low24h;
}
