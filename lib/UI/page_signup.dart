import 'package:Votop/UI/page_welcome.dart';
import 'package:Votop/ui/page_new_vote.dart';
import 'package:date_field/date_field.dart';
import 'package:email_validator/email_validator.dart';
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
  late DateTime? _birthDateValue;
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
                      if (email != null) {
                        if (email.isEmpty)
                          return 'Email required';
                        else if (!EmailValidator.validate(email))
                          return 'Email invalid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                  ),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      prefixIcon: Icon(Icons.calendar_today),
                      //border: OutlineInputBorder(),
                      //suffixIcon: Icon(Icons.event_note),
                      labelText: 'Date of Birth',
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                    e?.day == 0 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      _birthDateValue = value;
                    },
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
                                  'birthDate': _birthDateValue,
                                  'isAdmin': false,
                                };

                                await model.signUp(
                                  userData: userData,
                                  pass: _passwordController.text,
                                );

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WelcomePage()));
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
