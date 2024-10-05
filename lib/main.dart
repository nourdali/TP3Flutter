import 'package:flutter/material.dart';
void main() {
  runApp(SeriesApp());
}

class SeriesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
      appBar: AppBar(
        title: const Text("Popular TV Series"),
        backgroundColor: const Color.fromARGB(255, 172, 5, 158),
        ),

        body: Container(

          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: const [
              SeriesTile(
                imagePath: "lib/images/images.jpg",
                title: "Breaking Bad",
                details: "Une série sur un professeur de chimie devenu fabricant de méthamphétamine",
                ),
              SeriesTile(
                imagePath: "lib/images/strnthings.jpg",
                title: "Stranger Things",
                details:"Une série de science-fiction se déroulant dans les années 80.",
                ),
              SeriesTile(
                imagePath: "lib/images/harrypotter.jpg",
                title: "Harry Potter",
                details:"Une série basée sur les aventures d'un jeune sorcier, Harry Potter, et ses amis à l'école de sorcellerie",
                ),
              SeriesTile(
                imagePath: "lib/images/emily.jpg",
                title: "Emily In Paris",
                details:"Une comédie romantique",
                ),   
            ],

          ),
        ),   

      )
    );
  }
}


  class SeriesTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String details;

    

  
    const SeriesTile({required this.imagePath, required this.title, required this.details,});
    
      @override
      Widget build(BuildContext context) {

         return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SeriesDetailPage(title: title, details: details, imagePath: imagePath),
          ),
        );
      },

        child: Container(  
       margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(230, 216, 213, 178),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 350, // Largeur de l'image
              height: 200, // Hauteur de l'image
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8), // Espace entre l'image et le texte
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center, // Centrer le texte
          ),
        ],
      ),

    ),
    );
  }
}



class SeriesDetailPage extends StatelessWidget {
  final String title;
  final String details;
  final String imagePath;

  const SeriesDetailPage({required this.title, required this.details, required this.imagePath,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child:Text(
              details,
              style: const TextStyle(fontSize: 14),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}