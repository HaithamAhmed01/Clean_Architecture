import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(.3),
          ),
        ),
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.withOpacity(.3),
          ),
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}
