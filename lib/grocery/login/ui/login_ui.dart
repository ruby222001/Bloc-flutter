import 'package:bloc_prac/grocery/home/bloc/homebloc_bloc.dart';
import 'package:bloc_prac/grocery/home/ui/home.dart';
import 'package:bloc_prac/grocery/login/bloc/login_bloc.dart';
import 'package:bloc_prac/grocery/login/bloc/login_event.dart';
import 'package:bloc_prac/grocery/login/bloc/login_state.dart';
import 'package:bloc_prac/product/bloc/prodcuts_bloc.dart';
import 'package:bloc_prac/product/bloc/prodcuts_event.dart';
import 'package:bloc_prac/product/model/product_model.dart';
import 'package:bloc_prac/product/ui/product_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.white,
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              final productBloc = BlocProvider.of<ProductBloc>(context);
  productBloc.add(LoadProducts());

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: productBloc,
                    child: ProductPage(),
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login successful!')),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 16),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }

                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              LoginSubmitted(
                                emailController.text,
                                passwordController.text,
                              ),
                            );
                      },
                      child: const Text('Login'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
