import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cartbloc_event.dart';
part 'cartbloc_state.dart';

class CartblocBloc extends Bloc<CartblocEvent, CartblocState> {
  CartblocBloc() : super(CartblocInitial()) {
    on<CartblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
