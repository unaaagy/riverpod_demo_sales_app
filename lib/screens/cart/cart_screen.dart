import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    spacing: 8,
                    children: [
                      Image.asset(product.image, width: 60, height: 60),
                      Text(product.title),
                      const Expanded(child: SizedBox()),
                      Text('\$${product.price}'),
                    ],
                  ),
                );
              }).toList(), // output cart products here
            ),
            Text('Total price: \$${total}')

            // output totals here
          ],
        ),
      ),
    );
  }
}
