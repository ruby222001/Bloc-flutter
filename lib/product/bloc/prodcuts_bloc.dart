import 'package:bloc_prac/product/bloc/prodcuts_event.dart';
import 'package:bloc_prac/product/bloc/prodcuts_state.dart';
import 'package:bloc_prac/product/model/product_model.dart';
import 'package:bloc_prac/service/dio_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final DioClient dioClient;

  ProductBloc(this.dioClient) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final response = await dioClient.get('/products');

        // API returns a JSON array, decode and map to model:
        final List<dynamic> jsonData = response.data;

        final products = jsonData.map((e) => Product.fromJson(e)).toList();

        emit(ProductLoaded(products));
      } catch (e) {
        print(e);
        emit(ProductError('Failed to load products'));
      }
    });
  }
}
