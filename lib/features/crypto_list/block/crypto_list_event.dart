part of 'crypto_list_block.dart';

abstract class CryptoListEvent {}

class LoadCryptoList extends CryptoListEvent {
  List<String> symbols;
  LoadCryptoList(this.symbols);
}
