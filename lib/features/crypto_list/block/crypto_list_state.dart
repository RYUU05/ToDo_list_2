part of 'crypto_list_block.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.coinsList});
  final List<CryptoCoin> coinsList;
}
