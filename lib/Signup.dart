import 'package:flutter/material.dart';
import 'package:hive_project/View_Students.dart';

import 'Add_Student.dart';

class Signup extends StatefulWidget {
  Signup(BuildContext context, {super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordontroller = TextEditingController();

  final _cofirmController = TextEditingController();

  final password = 'flutter';
  final username = 'flutter';

  final confirmpassword = 'flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    'Signup',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  backgroundColor: const Color.fromARGB(255, 51, 136, 234),
                ),
                SafeArea(
                  child: Container(
                    child: Image.asset('assets/signup.jpg'),
                    width: 278,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Come With Us',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w700,
                          fontSize: 37),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(
                            width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      hintText: 'Username',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        hintText: 'Email',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _passwordontroller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'password',
                          prefixIcon: const Icon(
                            Icons.key,
                            color: Colors.black,
                          )),
                      validator: (_password) {
                        if (_password == null || _password.isEmpty) {
                          return 'Please Enter the password';
                        } else if (_password == password) {
                          return null;
                        } else if (_password != password) {
                          return 'Passdword doesnot match';
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _cofirmController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'Confirm password',
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.black,
                          )),
                      validator: (_Confirmpassword) {
                        if (_Confirmpassword == null ||
                            _Confirmpassword.isEmpty) {
                          return 'Please Enter the password';
                        } else if (_Confirmpassword == confirmpassword) {
                          return null;
                        } else if (_Confirmpassword != confirmpassword) {
                          return 'Passdword doesnot match';
                        }
                      }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        checklogin();
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      label: const Text('Signup',
                          selectionColor: Color.fromARGB(255, 255, 255, 7)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checklogin() async {
    final _username01 = _usernameController.text;

    final _emailname02 = _emailController.text;

    final _password03 = _passwordontroller.text;

    final _Confirmpassword04 = _cofirmController.text;

    if (_username01.isNotEmpty &&
        _emailname02.isNotEmpty &&
        _Confirmpassword04 == confirmpassword &&
        _password03 == password) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>const ViewStudents(),
        ),
      );
    } else {
      if (_password03 != password &&
          _Confirmpassword04 != confirmpassword &&
          _password03.isEmpty &&
          _Confirmpassword04.isEmpty) {
        // Allert button
        showDialog(
            context: context,
            builder: (ctx1) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                title: const Text('Error'),
                content: const Text('password doesnot matched / Data Empty'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            });
      }
    }
  }
}
