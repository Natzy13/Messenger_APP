import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();
  late String errormessage;
  late bool isError;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 128, 114, 1.0),
      appBar: null,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              topDesign(),
              inputContent(),
            ],
          ),
        ),
      ),
    );
  }

  var destyle = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  inputDecor(inputname) => InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: inputname,
        labelStyle: const TextStyle(color: Colors.black),
      );

  topDesign() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's chat",
                style: destyle,
              ),
              Text(
                "start here!",
                style: destyle,
              ),
            ],
          ),
          SizedBox(
            width: 210,
            height: 250,
            child: Image.asset(
              "images/logoapp.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      );

  textFieldForm(labelText, returnText, conTrol, tF) => TextFormField(
        obscureText: tF,
        controller: conTrol,
        decoration: inputDecor(labelText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return returnText;
          }
          return null;
        },
      );

  textFieldForm1(labelText, returnText, returnText2, conTrol, tF) =>
      TextFormField(
        obscureText: tF,
        controller: conTrol,
        decoration: inputDecor(labelText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return returnText;
          }
          if (value != passwordcontroller.text) {
            return returnText2;
          }
          return null;
        },
      );

  buttonStyle() => ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: const Size(250, 50),
        shape: const StadiumBorder(),
      );

  inputContent() => Form(
        key: _formKey,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 17),
                  width: 360,
                  height: 425,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: textFieldForm("Full Name", 'Please enter your name',
                      namecontroller, false),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(35, 85, 35, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: textFieldForm("Email", 'Please enter your email',
                      emailcontroller, false),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(35, 160, 35, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: textFieldForm("Password", 'Please enter your password',
                      passwordcontroller, true),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(35, 235, 35, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: textFieldForm1(
                      "Confirm Password",
                      'Please confirm your password',
                      'Password does not match',
                      cpasswordcontroller,
                      true),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(70, 335, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      //  _register();
                    },
                    style: buttonStyle(),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(250, 128, 114, 1.0)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(135, 395, 0, 0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Already signed up?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

//  void _register() {
  //  setState(() {
  //   // Validate the form
  //  if (_formKey.currentState!.validate()) {
  //    createUser();
  //   registerUser();
  //  } else {
  //    namecontroller.clear();
  //    emailcontroller.clear();
  //    passwordcontroller.clear();
  //    cpasswordcontroller.clear();
  //   }
  //  });
//  }

  //Future createUser() async {
  //final user = FirebaseAuth.instance.currentUser!;
  //final userid = user.uid;
  //final docUser = FirebaseFirestore.instance.collection('Users').doc(userid);

  //final users = Users(
  // id: userid,
  // name: namecontroller.text,
  //email: emailcontroller.text.toLowerCase(),
  // image:
  //   'https://firebasestorage.googleapis.com/v0/b/flutterdb-88336.appspot.com/o/images%2Fdefault.jpg?alt=media&token=6c23fd1e-dd83-490e-a4e8-98657301790f&_gl=1*1m4ir62*_ga*MTg3NDI1NTYzNy4xNjk1NTMxMDUw*_ga_CW55HF8NVT*MTY5NjQ2MzE1OS4xNC4xLjE2OTY0NjM4MTYuMzMuMC4w');

  // final json = users.toJson();
  //await docUser.set(json);

  // goToAuthenticator();
}

  //Future registerUser() async {
    //try {
     // await FirebaseAuth.instance.createUserWithEmailAndPassword(
       // email: emailcontroller.text.trim(),
       // password: passwordcontroller.text.trim(),
      //);
     // createUser();
      //setState(() {
       // errormessage = "";
     // });
   // } on FirebaseAuthException catch (e) {
  //    print(e);
     // setState(() {
      //  errormessage = e.message.toString();
     // });
   // }
  //}

  //goToAuthenticator() {
  //  Navigator.of(context).push(
    //  MaterialPageRoute(
      //  builder: (context) => const authenticator(),
     // ),
   // );
  //}
//}
