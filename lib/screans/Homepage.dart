import 'package:english_words/english_words.dart';
import 'package:favorite/provider/favorite_provider.dart';
import 'package:favorite/screans/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            title: Text(word),
            trailing: IconButton(
                onPressed: () {
                  provider.toggleFavorite(word);
                },
                icon: provider.isExist(word)
                    ? const Icon(Icons.favorite, color: Colors.blue)
                    : const Icon(Icons.favorite_border)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => FavoritePage(),
          );
          Navigator.push(context, route);
        },
        label: const Text('favorite'),
      ),
    );
  }
}
