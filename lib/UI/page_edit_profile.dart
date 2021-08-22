import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
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
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              onDateSelected: (DateTime value) {
                print(value);
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
                  ElevatedButton(onPressed: () {}, child: Text('Save')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
