import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_1/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final email = TextEditingController();

  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isdatamatched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 35, 24, 14),
        title: const Text(
          'The Richest people in the world',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/blackkk.jpg'), fit: BoxFit.cover),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 400,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be Empty';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontStyle: FontStyle.italic),
                        controller: email,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Username or Email',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'password cannot be Empty';
                          } else {
                            return null;
                          }
                        },
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 254, 254),
                            fontStyle: FontStyle.italic),
                        controller: password,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white)),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 14, 29, 246)),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              checking(context);
                            } else {}
                          },
                          icon: Icon(Icons.done),
                          label: Text(
                            'LOGIN',
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  void checking(BuildContext context) async {
    final mail = email.text;
    final pass = password.text;
    if (mail == 'sufad' && pass == '12345') {
      final sharedprefs = await SharedPreferences.getInstance();
      sharedprefs.setBool('shared_key_value', true);
      setState(() {
        isdatamatched = true;
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const Homepage();
        }));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Username and Password are incorrect'),
        backgroundColor: Colors.red,
      ));
      setState(() {
        isdatamatched = false;
      });
    }
  }
}
