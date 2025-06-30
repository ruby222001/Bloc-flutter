import 'package:bloc_prac/grocery/home/bloc/homebloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_prac/grocery/home/bloc/homebloc_bloc.dart';
import 'package:bloc_prac/grocery/home/bloc/homebloc_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryLoaded) {
            final cartItems = state.cartItems;

            if (cartItems.isEmpty) {
              return const Center(child: Text('Your cart is empty.'));
            }

            return ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 50, height: 50),
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<GroceryBloc>().add(RemoveItemFromCart(item));
                    },
                  ),
                );
              },
            );
          } else if (state is GroceryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GroceryError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text('No cart data available.'));
        },
      ),
    );
  }
}
