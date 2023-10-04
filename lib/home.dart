import 'package:flutter/material.dart';

import 'fullscreen_image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> images = [
    "assets/img1.jpg",
    "assets/img2.jpg",
    "assets/img3.jpg",
    "assets/img4.jpg",
    "assets/img5.jpg",
    "assets/img6.jpg",
    "assets/img7.jpg",
    "assets/img1.jpg",
    "assets/img2.jpg",
    "assets/img3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Image Gallary"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final imagePath = images[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenImagePage(
                            imagePaths: images,
                            currentIndex: index,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: imagePath,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  );
                })));
  }
}
