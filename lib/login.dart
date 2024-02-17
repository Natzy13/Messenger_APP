import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[400],
      appBar: null,
      body: SingleChildScrollView(
        child: Column(children: [
          topDesign(),
          inputContent(),
        ]),
      ),
    );
  }

  topDesign() => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35),
            width: 200,
            height: 200,
            child: Image.asset(
              "images/logoapp.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          topText("AM BUSSIN", weightFontOne),
          topText("LOGIN", weightFontTwo),
          const SizedBox(
            height: 30,
          ),
        ],
      );

  inputDecor(inputname, iCon) => InputDecoration(
        icon: Icon(
          iCon,
          color: Colors.black,
        ),
        border: const UnderlineInputBorder(),
        labelText: inputname,
        labelStyle: const TextStyle(color: Colors.black),
      );

  textFieldForm(labelText, iCon, returnText, conTrol, tF) => TextFormField(
        obscureText: tF,
        controller: conTrol,
        decoration: inputDecor(labelText, iCon),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return returnText;
          }
          return null;
        },
      );

  buttonStyle() => ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: const Size(300, 50),
        shape: const StadiumBorder(),
      );

  var weightFontOne =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var weightFontTwo =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  topText(title, weightStyle) => Text(
        title,
        style: weightStyle,
      );

  inputContent() => Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: textFieldForm("Email", Icons.people,
                  'Please enter your email', emailController, false),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: textFieldForm("Password", Icons.lock_rounded,
                  'Please enter your password', passwordController, true),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: buttonStyle(),
              onPressed: () {},
              child: const Text(
                'LOGIN',
                style: TextStyle(fontSize: 15, color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "New user? Register Now",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      );
}
