import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/models.dart';
import 'components/components.dart';

class PasswordRecoveryPage extends StatelessWidget {
  bool obscureText = true;
  IconData icon = Icons.visibility;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text(
                        'Password Recovery',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonBack(),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if(_emailController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Insira o e-mail para recuperação!'),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }else {
                                  model.recoveryPassword(_emailController.text);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Confira seu e-mail!'),
                                      backgroundColor: Theme.of(context).primaryColor,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                              },
                              child: Text('Enviar'),
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
