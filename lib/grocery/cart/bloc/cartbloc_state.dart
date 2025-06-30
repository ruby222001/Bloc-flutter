part of 'cartbloc_bloc.dart';

sealed class CartblocState extends Equatable {
  const CartblocState();
  
  @override
  List<Object> get props => [];
}

final class CartblocInitial extends CartblocState {}
