import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_p1/presentation/mixin/home_mixin.dart';
import 'package:firebase_auth_p1/presentation/password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SecondPage.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return const SecondHomePage();
            } else {
              return Scaffold(
                backgroundColor: Colors.amber,
                body: SafeArea(
                  child: Column(
                    children: [
                      const Center(
                        child: Text('Madina'),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'enter your Email...',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'enter your password...',
                            prefixIcon: Icon(Icons.lock_open),
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(LoginWithEmailEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(SignUpEvent(
                              email: emailController.text,
                              password: passwordController.text));
                        },
                        child: const Text('Sign Up'),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(GoogleEvent());
                        },
                        child: const Text('With Google'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(FacebookEvent());
                        },
                        child: const Text('With Facebook'),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
