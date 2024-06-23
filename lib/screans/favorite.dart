import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
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
    );
  }
}
