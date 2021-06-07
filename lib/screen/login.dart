import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
              _logoImage,
              Stack(
                children: [
                  _inputForm(size),
                  _authButton(size),
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

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
      );

  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: RaisedButton(
              child: Text("Login",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print(_passwordController.text.toString());
                }else{
                  print("button pressed");
                }
              }),
        ),
      );

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    icon: Icon(Icons.vpn_key),
                    labelText: "Password",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please input corrent password";
                    }
                    return null;
                  },
                ),
                Container(
                  height: 8,
                ),
                Text("Forgot Password"),
              ],
            ),
          ),
          // Container(width:100, height: 50, color: Colors.black,),
        ),
      ),
    );
  }
}
