import 'package:Votop/ui/page_new_vote.dart';
import 'package:firedart/auth/exceptions.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        if (model.isLoading) return Center(child: CircularProgressIndicator());
        return Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (String? name) {
                      if (name != null && name.isEmpty)
                        return 'Name is required';
                      return null;
                    },
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
                    controller: _birthDateController,
                    validator: (String? birthDate) {
                      if (birthDate != null && birthDate.isEmpty)
                        return 'Birth Date is required';
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Birth Date',
                      icon: Icon(Icons.date_range),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (String? password) {
                      if (password != null && password.isEmpty)
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
                              try {
                                Map<String, dynamic> userData = {
                                  'name': _nameController.text,
                                  'email': _emailController.text,
                                  'birthDate': _birthDateController.text,
                                };

                                await model.signUp(
                                  userData: userData,
                                  pass: _passwordController.text,
                                );

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NewVote()));
                              } on AuthException catch (e) {
                                print(e);
                              }
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
