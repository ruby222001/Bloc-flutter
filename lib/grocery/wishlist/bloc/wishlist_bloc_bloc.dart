import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
