import 'package:bloc_prac/grocery/model/model.dart';

abstract class GroceryEvent {}

class LoadGroceryItems extends GroceryEvent {}

class AddItemToCart extends GroceryEvent {
  final GroceryItem item;

  AddItemToCart(this.item);
}

class RemoveItemFromCart extends GroceryEvent {
  final GroceryItem item;

  RemoveItemFromCart(this.item);
}
