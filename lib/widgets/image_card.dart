import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/pixabay_image_model.dart';

class ImageCard extends StatelessWidget {
  final PixabayImage image;
  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: SizedBox(
              child: Image.network(image.largeImageURL),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                image.webformatURL,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Likes: ${image.likes}',
                    style: const TextStyle(
                        fontFamily: "Nunito", fontWeight: FontWeight.normal),
                  ),
                  Text(
                    'Views: ${image.views}',
                    style: const TextStyle(fontFamily: "Nunito"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
