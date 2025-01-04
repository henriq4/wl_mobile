import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", width: 30),
            Text("Taski"),
          ],
        ),
        actions: [
          Text("John"),
          Image(
            image: CachedNetworkImageProvider(
              "https://avatars.githubusercontent.com/u/2975483?v=4",
            ),
            width: 30,
          ),
        ],
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "https://avatars.githubusercontent.com/u/2975483?v=4",
          width: 30,
          height: 30,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
