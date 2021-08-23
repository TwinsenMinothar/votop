import 'package:Votop/models/models.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firedart/auth/exceptions.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:scoped_model/scoped_model.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  late DateTime? _birthDateValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, child, model) {
          if (model.isLoading)
            return Center(child: CircularProgressIndicator());
          else {
            _nameController.text = model.userData['name'];
            _emailController.text = model.userData['email'];
            _birthDateValue = model.userData['birthDate'];
          }

          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                    enabled: false,
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
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                  ),
                  DateTimeFormField(
                    initialValue: model.userData['birthDate'],
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      icon: Icon(Icons.calendar_today),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    mode: DateTimeFieldPickerMode.date,
                    autovalidateMode: AutovalidateMode.always,
                    validator: (e) =>
                        e?.day == 0 ? 'Please not the first day' : null,
                    onDateSelected: (DateTime value) {
                      _birthDateValue = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel')),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                Map<String, dynamic> userData = {
                                  'name': _nameController.text,
                                  'email': _emailController.text,
                                  'birthDate': _birthDateValue,
                                  'isAdmin': model.userData['isAdmin'],
                                };

                                await model.editUser(
                                  userData: userData,
                                );

                                Navigator.of(context).pop();
                              } on AuthException catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
