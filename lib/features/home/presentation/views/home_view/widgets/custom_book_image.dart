import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, this.imageUrl}) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: FancyShimmerImage(
            errorWidget: const Icon(Icons.error, size: 30),
            imageUrl: imageUrl!,
            shimmerBaseColor: Colors.grey[500]!,
            shimmerDuration: const Duration(seconds: 1),
            shimmerHighlightColor: Colors.grey[100]!,
          ),
        ),
      ),
    );
  }
}
