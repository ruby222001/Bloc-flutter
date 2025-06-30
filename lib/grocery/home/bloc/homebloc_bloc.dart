import 'package:bloc_prac/grocery/home/bloc/homebloc_event.dart';
import 'package:bloc_prac/grocery/home/bloc/homebloc_state.dart';
import 'package:bloc_prac/grocery/model/grocery_model.dart';
import 'package:bloc_prac/grocery/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  GroceryBloc() : super(GroceryInitial()) {
    on<LoadGroceryItems>((event, emit) async {
      emit(GroceryLoading());

      try {
        await Future.delayed(const Duration(seconds: 1)); // simulate API delay

        final data = GroceryData.groceryProducts
            .map((e) => GroceryItem.fromMap(e))
            .toList();

        emit(GroceryLoaded(data, cartItems: []));
      } catch (e) {
        emit(GroceryError('Failed to load grocery items'));
      }
    });

    on<AddItemToCart>((event, emit) {
      if (state is GroceryLoaded) {
        final currentState = state as GroceryLoaded;
        final updatedCart = List<GroceryItem>.from(currentState.cartItems)
          ..add(event.item);

        emit(GroceryLoaded(currentState.items, cartItems: updatedCart));
      }
    });

    on<RemoveItemFromCart>((event, emit) {
      if (state is GroceryLoaded) {
        final currentState = state as GroceryLoaded;
        final updatedCart = List<GroceryItem>.from(currentState.cartItems)
          ..removeWhere((item) => item.id == event.item.id);

        emit(GroceryLoaded(currentState.items, cartItems: updatedCart));
      }
    });
  }
}
