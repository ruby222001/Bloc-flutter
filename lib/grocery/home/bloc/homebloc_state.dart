import 'package:bloc_prac/grocery/model/model.dart';

abstract class GroceryState {}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<GroceryItem> items;
  final List<GroceryItem> cartItems;

  GroceryLoaded(
    this.items, {
    this.cartItems = const [],
  });
}

class GroceryError extends GroceryState {
  final String message;

  GroceryError(this.message);
}
