import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/user_model.dart';
import 'components/components.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obscureText = true;
  IconData icon = Icons.visibility;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(child: CircularProgressIndicator());
            return Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          icon: Icon(Icons.person),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (String? email) {
                          if (email != null && email.isEmpty)
                            return 'Email is required';
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (String? email) {
                          if (email != null && email.isEmpty)
                            return 'Password is required';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonBack(),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await model.signUp({
                                    'email': _emailController.text,
                                    'password': _passwordController.text
                                  });
                                }
                              },
                              child: Text('Cadastrar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}

