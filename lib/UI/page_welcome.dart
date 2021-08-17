import 'package:Votop/models/user_model.dart';
import 'package:firedart/auth/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './ui.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool obscureText = true;
  IconData icon = Icons.visibility;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      if (model.isLoading) return Center(child: CircularProgressIndicator());
      return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        'Welcome to VoTop',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      validator: (String? value) {
                        if (value != null && value.isEmpty)
                          return 'Email required';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value != null && value.isEmpty)
                          return 'Password required';
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(icon),
                          onPressed: () {
                            setState(() {
                              if (obscureText == true) {
                                obscureText = false;
                                icon = Icons.visibility_off;
                              } else {
                                obscureText = true;
                                icon = Icons.visibility;
                              }
                            });
                          },
                        ),
                      ),
                      obscureText: obscureText,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueci a senha',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4DB4FE),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            try {
                              await model.doAuth({
                                "email": _emailController.text,
                                "password": _passwordController.text,
                                'signUp': false,
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => NewVote()));
                            } on AuthException catch (e) {
                              print(e);
                            }
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp()));
                        },
                        child: Text('Sing Up'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewVote()));
                        },
                        child: Text('New poll without Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
