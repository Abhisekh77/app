// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:loginpage/use_me/HomePage.dart';
import 'package:loginpage/bottomnav.dart';
import 'package:loginpage/models/const.dart';
import 'package:loginpage/signup.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  getApi() async {
    print('asd');
    var response =
        await http.get(Uri.parse('http://mark.bslmeiyu.com/api/getplaces'));
    var body = response.body;
    print(body);
    setState(() {});
  }

  bool isVisible = true;
  var getname = '';
  var getpassword = '';
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset(
              'assets/mountainelogo 3.png',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'Login To Your Account',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            )),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'email',
                    icon: Icons.email,
                    suffixIcon: Icons.reddit,
                    controller: emailcontroller,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'password',
                    icon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    controller: passwordcontroller,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (t) {}),
                      Text(
                        'Remember me',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: GestureDetector(
                    child: Text(
                      'Forget Password ?',
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20),
              child: Container(
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    print('Hi');

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return bottom_nav();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an Account ?',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  child: Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                ),
                MaterialButton(
                  onPressed: (() {
                    getApi();
                  }),
                  // child: Text('HII'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  CustomTextField({
    required this.hintText,
    required this.icon,
    this.suffixIcon,
    this.controller,
  });

  final String hintText;
  final IconData icon;
  final IconData? suffixIcon;
  final controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, //stateful ma controller lekhe hunxa tara
      //stateless ma chai widget.controller lekhna parne hunxa la
      obscureText: isVisible,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.icon),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // labelText: hintText,
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
                print(isVisible);
              });
              print(isVisible);
            },
            icon: Icon(
                isVisible == true ? Icons.visibility : Icons.visibility_off)),
      ),
    );
  }
}
