import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.book, this.onTap}) : super(key: key);

  final BookEntity book;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (){},
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: AspectRatio(
          aspectRatio: 2.6 / 4,
          child: FancyShimmerImage(
            errorWidget: const Icon(Icons.error, size: 30),
            imageUrl: book.imageUrl ?? '',
            shimmerBaseColor: Colors.grey[500]!,
            shimmerDuration: const Duration(seconds: 1),
            shimmerHighlightColor: Colors.grey[100]!,
          ),
        ),
      ),
    );
  }
}
