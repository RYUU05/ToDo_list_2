import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/features/crypto_list/block/crypto_list_block.dart';
import 'package:flutter_practice/features/crypto_list/widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBlock = CryptoListBlock();
  int currentIndex = 0;
  List<String> selectedCoins = [
    'BTC',
    'ETH',
    'BNB',
    'SOL',
    'AID',
    'CAG',
    'DOV',
  ];

  @override
  void initState() {
    super.initState();
    _cryptoListBlock.add(LoadCryptoList(selectedCoins));
  }

  void _showAddCoinDialog() {
    var controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 45, 45, 45),
          title: Text('Add Crypto', style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter cryptos name',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                var symbol = controller.text.trim().toUpperCase();
                if (symbol.isNotEmpty && !selectedCoins.contains(symbol)) {
                  setState(() {
                    selectedCoins.add(symbol);
                  });
                  _cryptoListBlock.add(LoadCryptoList(selectedCoins));
                }
                Navigator.pop(ctx);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

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
        actions: [
          IconButton(
            onPressed: _showAddCoinDialog,
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _cryptoListBlock.add(LoadCryptoList(selectedCoins));
        },
        child: BlocBuilder<CryptoListBlock, CryptoListState>(
          bloc: _cryptoListBlock,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.coinsList.length,
                itemBuilder: (context, index) {
                  var coin = state.coinsList[index];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/favorites');
          }
          if (index == 2) {
            Navigator.pushNamed(context, '/settings');
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
