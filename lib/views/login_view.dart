import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();

    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(hintText: 'Enter your email'),
                  ),
                  TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: _password,
                    decoration:
                        const InputDecoration(hintText: 'Enter your password'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;

                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        print(credential);
                      } on FirebaseAuthException catch (e) {
                        // switch (e.code) {
                        //   case 'user-not-found':
                        //     print('user not found');
                        //     break;
                        //   case 'wrong-password':
                        //     print('wrong password');
                        //     break;
                        //   default:
                        //     print(e.message);
                        // }

                        if (e.code == 'user-not-found') {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text(e.message.toString())),
                          // );

                          print('user not found');
                        } else if (e.code == 'wrong-password') {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text(e.message.toString())),
                          // );

                          print('wrong password');
                        }

                        // print(e.code);
                      } catch (e) {
                        print(e);
                        print(e.runtimeType);
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              );
            default:
              return const Text('Loading');
          }
        },
      ),
    );
  }
}
