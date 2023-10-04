import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class FullScreenImagePage extends StatelessWidget {
  final List<String> imagePaths;
  final int currentIndex;

  const FullScreenImagePage({super.key, 
    required this.imagePaths,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
      ),
      body: PageView.builder(
        itemCount: imagePaths.length,
        controller: PageController(initialPage: currentIndex),
        itemBuilder: (context, index) {
          final imagePath = imagePaths[index];
          return PinchZoom(
            resetDuration: const Duration(milliseconds: 100),
            maxScale: 2.5,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          );
        },
      ),
    );
  }
}
