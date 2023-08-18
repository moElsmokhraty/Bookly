import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsViewAppBar extends StatelessWidget {
  const BookDetailsViewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop(context);
            },
            icon: const Icon(
              Icons.close_outlined,
              size: 25,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 25,
            )),
      ],
    );
  }
}
