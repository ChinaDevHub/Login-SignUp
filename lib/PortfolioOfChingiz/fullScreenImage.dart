import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  const FullImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30)),
        ),
      ),
      body: Center(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4,
              child: Image.asset("lib/assets/my.png")
              ),
          ),
    );
  }
}