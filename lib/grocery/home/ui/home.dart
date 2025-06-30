import 'package:bloc_prac/grocery/home/bloc/homebloc_bloc.dart';
import 'package:bloc_prac/grocery/home/bloc/homebloc_event.dart';
import 'package:bloc_prac/grocery/home/bloc/homebloc_state.dart';
import 'package:bloc_prac/grocery/cart/ui/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroceryListPage extends StatelessWidget {
  const GroceryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<GroceryBloc, GroceryState>(
        builder: (context, state) {
          if (state is GroceryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GroceryLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 50, height: 50),
                  title: Text(item.name),
                  subtitle: Text(item.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      context.read<GroceryBloc>().add(AddItemToCart(item));
                    },
                  ),
                );
              },
            );
          } else if (state is GroceryError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text('Welcome to Grocery Store!'));
        },
      ),
    );
  }
}
