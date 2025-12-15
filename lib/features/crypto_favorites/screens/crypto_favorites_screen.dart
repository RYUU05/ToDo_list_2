import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_favorites/screens/widgets/custom_appbar.dart';
import 'package:flutter_practice/features/widgets/nav_bar.dart';

class CryptoFavoritesScreen extends StatefulWidget {
  const CryptoFavoritesScreen({super.key});

  @override
  State<CryptoFavoritesScreen> createState() => _CryptoFavoritesScreenState();
}

class _CryptoFavoritesScreenState extends State<CryptoFavoritesScreen> {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  List<Map<String, dynamic>> favorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    var userId = auth.currentUser?.uid;
    if (userId != null) {
      var snapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .get();
      setState(() {
        favorites = snapshot.docs.map((doc) => doc.data()).toList();
        isLoading = false;
      });
    }
  }

  void removeFavorite(String name) async {
    var userId = auth.currentUser?.uid;
    if (userId != null) {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .doc(name)
          .delete();
      loadFavorites();
    }
  }

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: CustomAppBar(text: "BTC"),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : favorites.isEmpty
          ? Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                var fav = favorites[index];
                return Card(
                  color: Color.fromARGB(255, 45, 45, 45),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: fav['imageUrl'] != null
                        ? Image.network(fav['imageUrl'], width: 40, height: 40)
                        : Icon(Icons.currency_bitcoin, color: Colors.white),
                    title: Text(
                      fav['name'] ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      '\$${fav['priceInUSD']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        removeFavorite(fav['name']);
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Navbar(currentIndex: currentIndex),
    );
  }
}
