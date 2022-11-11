import 'package:flutter/material.dart';

import 'loginpage.dart';





class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
     gotologin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              SafeArea(
                child: Container(
                  child: Image.asset('assets/splash01.jpg'),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'WELCOME',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 50),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Start to study about your life;\n Until you know meaning of yours.',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
),
);
  }
   Future<void> gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Loginpage(),
    ));
  }
}