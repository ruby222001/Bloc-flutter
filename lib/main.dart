import 'package:bloc_prac/grocery/home/bloc/homebloc_event.dart';
import 'package:bloc_prac/grocery/login/bloc/login_bloc.dart';
import 'package:bloc_prac/grocery/login/ui/login_ui.dart';
import 'package:bloc_prac/product/bloc/prodcuts_bloc.dart';
import 'package:bloc_prac/service/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(
          create: (_) => ProductBloc(DioClient()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Grocery App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginPage(),
    );
  }
}
