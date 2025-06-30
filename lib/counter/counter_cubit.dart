import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  //incremenr
  void increment() => emit(state + 1);
  //decrement
  void decremnt() => emit(state - 1);

  //on state change => do something
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
