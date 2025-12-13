import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/repositories/crypto_coin/crypto_coins_repositories.dart';
import 'package:flutter_practice/repositories/crypto_coin/models/crypto_coin.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBlock extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBlock() : super(CryptoListInitial() as CryptoListState) {
    on<LoadCryptoList>((event, emit) async {
      var coinsList = await CryptoCoinsRepositories().getCoinsList(
        event.symbols,
      );
      emit(CryptoListLoaded(coinsList: coinsList));
    });
  }
}
