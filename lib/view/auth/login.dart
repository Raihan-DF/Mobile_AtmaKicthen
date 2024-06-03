import 'package:atmakitchen/view/auth/register.dart';
import 'package:atmakitchen/view/profileView.dart';
import 'package:flutter/material.dart';
import 'package:atmakitchen/service/auth_service.dart';
import 'package:atmakitchen/service/global.dart';
import 'package:atmakitchen/view/homeViewCustomer.dart';
import 'package:atmakitchen/view/navbarCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String token = '';
  String _username = '';
  String _password = '';

  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loginAction();
  }

  void loginAction() async {
    if (username.toString().isEmpty || password.toString().isEmpty) {
      errorSnackBar(context, 'Email dan Password Tidak Boleh Kosong !');
    } else {
      try {
        Map<String, dynamic> responseData =
            await AuthService().login(username, password);
        if (responseData.containsKey('user')) {
          Map<String, dynamic> userData = responseData['user'];
          String token = responseData['access_token'];

          // Save the access token to shared preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', token);

          if (userData.containsKey('id_role')) {
            if (userData['id_role'] == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MyApp(),
                ),
              );
            } else if (userData['id_role'] == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfileView(),
                ),
              );
            } else {
              errorSnackBar(context, 'Tidak ada akun !');
            }
          }
        }
      } catch (e) {
        errorSnackBar(context, e.toString());
      }
    }
  }

  login() {
    print('username : $_username');
    print('password : $_password');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-rehan.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo-rehan.png"),
                  ),
                ),
              ),
            ),
            Text(
              "Atma Kitchen",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: SingleChildScrollView(
                  child: FormLogin(height, context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Form FormLogin(double height, BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            scrollPadding: EdgeInsets.only(bottom: 20),
            controller: username,
            // onChanged: (value) {
            //   setState(() {
            //     _username = value;
            //   });
            // },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Please enter your Username';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            scrollPadding: EdgeInsets.only(bottom: 20),
            controller: password,
            // onChanged: (value) {
            //   setState(() {
            //     _password = value;
            //   });
            // },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.key),
              labelText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Please enter your Password';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgot Passoword?",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            onPressed: () {
              loginAction();
            },
            child: Text("Login"),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("New User?"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: Text("Sign Up"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
