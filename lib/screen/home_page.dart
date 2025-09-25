import 'package:flutter/material.dart';
import 'package:praktikum_mobile/data/game_store_data.dart';
import 'package:praktikum_mobile/screen/detail_page.dart';
import 'package:praktikum_mobile/screen/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 254, 254, 255),
          ),
        ),
        backgroundColor: Colors.blue[700],
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: Colors.white),
          ),
          IconButton(
            icon: Icon(Icons.logout_outlined, color: Colors.white),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Welcome $username",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Silahkan pilih game dibawah ini",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.blue[900],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: gameList.length,
                  itemBuilder: (context, index) {
                    return _gameStore(context, index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
      (route) => false,
    );
  }

  Widget _gameStore(context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(game: gameList[index]);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar game
            Container(
              height: 100,
              width: double.infinity,
              child: Image.network(
                gameList[index].imageUrls[0],
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 8),

            //name
            Text(
              gameList[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue[900],
              ),
            ),

            //releaseDate
            Text(
              gameList[index].releaseDate,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),

            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Review Average",
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),

                //price
                Text(
                  gameList[index].price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 248, 0, 0),
                  ),
                ),
              ],
            ),

            //reviewAverage
            Text(
              gameList[index].reviewAverage.toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
