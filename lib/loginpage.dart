
import 'package:flutter/material.dart';

import 'Add_Student.dart';
import 'Signup.dart';
import 'View_Students.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _ConfirmController = TextEditingController();
  
  bool _isdatamatched = true;

  final _formkey = GlobalKey<FormState>();

  final name = 'flutter';
  final password = 'flutter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              key: _formkey,
              children: [
                AppBar(
                  title: const Text(
                    'Login',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  backgroundColor: const Color.fromARGB(255, 66, 135, 247),
                ),
                SafeArea(
                  child: Container(
                    child: Image.asset('assets/login.jpg'),
                    width: 300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Hey There..",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 40,
                          fontStyle: FontStyle.normal),
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
                      validator: (_username) {
                        if (_username == null || _username.isEmpty) {
                          return 'Please Enter the Username';
                        } else if (_username == name) {
                          return null;
                        } else if (_username != name) {
                          return "username doest't matched";
                        }
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          hintText: 'Password',
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
                const SizedBox(
                  height: 0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        checklogin();
                      },
                      icon: const Icon(Icons.add),
                      label: Text('Login'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 96.0),
                      child: Row(
                        children: [
                          const Text(
                            'Not a member? ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signup(context),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            label: const Text('Reginster Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> checklogin() async {
    final _username= _usernameController.text;
    final _password = _passwordController.text;
    if (_username ==  name && _password == password) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>ViewStudents(),
        ),
      );
    } else if (_username != name &&
        _password != password &&
        _username.isEmpty &&
        _password.isEmpty) {
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
              content:
                  const Text('Username password doesnot matched  datas empty'),
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
      setState(() {
        _isdatamatched = false;
     });
}
}
}