import 'package:flutter/material.dart';
import 'package:loginpage/models/const.dart';
import 'package:loginpage/signin.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _SignPageState();
}

class _SignPageState extends State<signup> {
  bool isVisible = true;
  var getname = '';
  var getpassword = '';
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

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
              height: 50,
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
                    hintText: 'Email/Username',
                    icon: Icons.email,
                    suffixIcon: Icons.reddit,
                    controller: emailcontroller,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'new password',
                    icon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    controller: passwordcontroller,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'new password',
                    icon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    controller: passwordcontroller,
                  ),
                ],
              ),
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
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onPressed: () {},
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
                  'Already have an Account ?',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
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
