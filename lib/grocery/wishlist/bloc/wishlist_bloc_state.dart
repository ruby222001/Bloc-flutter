part of 'wishlist_bloc_bloc.dart';

sealed class WishlistBlocState extends Equatable {
  const WishlistBlocState();
  
  @override
  List<Object> get props => [];
}

final class WishlistBlocInitial extends WishlistBlocState {}
