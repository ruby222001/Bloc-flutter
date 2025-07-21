
import 'package:flutter/material.dart';

void main() {
  runApp(
    // MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => LoginBloc()),
    //     BlocProvider(
    //       create: (_) => ProductBloc(DioClient()),
    //     ),
    //   ],
      // child: 
      const MyApp(),
    // ),
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
      // home: LoginPage(),
    );
  }
}
