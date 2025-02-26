import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfItemsInCart = ref.watch(cartNotifierProvider).length;

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }));
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: 24,
          right: 4,
          child: Container(
            width: 16,
            height: 16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.redAccent,
            ),
            child: Text(
              numberOfItemsInCart.toString(),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
