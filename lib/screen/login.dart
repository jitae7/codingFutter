import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey _formKey = GlobalKey();

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
              Stack(
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              labelText: "Email",
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please input corrent Email";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_circle),
                              labelText: "Password",
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Please input corrent password";
                              }
                              return null;
                            },
                          ),
                          Text("Forgot Password"),
                        ],
                      )),
                  // Container(width:100, height: 50, color: Colors.black,),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Text("Don't have an Account? Create one"),
              Container(
                height: size.height * 0.05,
              )
            ],
          ),
        ],
      ),
    );
  }
}
