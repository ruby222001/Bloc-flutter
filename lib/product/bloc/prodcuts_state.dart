
import 'package:bloc_prac/product/model/product_model.dart';

abstract class ProductState {}


/*state of States are outputs: they describe what your UI should show based on the latest logic.

States let your widgets reactively rebuild when the data or condition changes.*/
class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}