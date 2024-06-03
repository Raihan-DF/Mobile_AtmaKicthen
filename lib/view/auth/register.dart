import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-rehan.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the start
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo-rehan.png"),
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
                FormRegister(height, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form FormRegister(double height, BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: fullNameController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: "Full Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Please enter your Full Name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Please enter your Email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone),
              labelText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            validator: (value) {
              if (value == '' || value!.isEmpty) {
                return 'Please enter your Phone Number';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
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
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 50),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              // Implement your registration logic here
            },
            child: Text("Register"),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the login page
                },
                child: Text("Login"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
