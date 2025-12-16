import 'package:flutter/material.dart';
import 'package:flutter_practice/features/crypto_favorites/screens/widgets/custom_appbar.dart';
import 'package:flutter_practice/features/widgets/nav_bar.dart';
import 'package:flutter_practice/repositories/auth/auth_repositories.dart';

class Favorit extends StatefulWidget {
  const Favorit({super.key});

  @override
  State<Favorit> createState() => FavoritStat();
}

class FavoritStat extends State<Favorit> {
  List<Map<String, dynamic>> favorits = [];
  bool isloding = true;

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    var userId = authRepo.value.currentuser?.uid;
    if (userId != null) {
      var snapshot = await firestor
          .collection('users')
          .doc(userId)
          .collection('favorites')
          .get();
      setState(() {
        favorits = snapshot.docs.map((doc) => doc.data()).toList();
        isloding = false;
      });
    }
  }

  void removeFavorite(String name) async {
    var userId = authRepo.value.currentuser?.uid;
    if (userId != null) {
      await firestor
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
      appBar: CustomAppBar(text: "Favorite list"),
      body: isloding
          ? Center(child: CircularProgressIndicator(color: Colors.white))
          : favorits.isEmpty
          ? Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favorits.length,
              itemBuilder: (context, index) {
                var fav = favorits[index];
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
