import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:praktikum_mobile/models/game_store_model.dart';

class DetailPage extends StatelessWidget {
  final GameStore game;
  const DetailPage({super.key, required this.game});

  Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Game', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // gambar utama
              Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[300],
                child: Image.network(game.imageUrls[0], fit: BoxFit.cover),
              ),
              const SizedBox(height: 12),

              // nama + release date
              Text(
                game.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                game.releaseDate,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),

              // tags + price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(game.tags.join(', ')),
                  Text(
                    game.price,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // about
              Text(game.about, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 12),

              // review
              Text(
                "Review Count: ${game.reviewCount}",
                style: TextStyle(color: Colors.blue[800]),
              ),
              Text(
                "Review Average: ${game.reviewAverage}",
                style: TextStyle(color: Colors.blue[800]),
              ),
              const SizedBox(height: 20),

              // tombol link
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    _launchURL(game.linkStore);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: BorderSide(color: Colors.blue),
                  ),
                  child: const Text("Link Store"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
