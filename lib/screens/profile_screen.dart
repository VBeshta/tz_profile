import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tz_profile/button/button.dart';

enum Gender { man, woman }

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DateTime? _dateBirth;
  //dynamic _pickImageError;
  File? _image;

  //late TextEditingController _inputNameController;
  //late TextEditingController _inputSurnameController;
  //late TextEditingController _inputDateBirthController;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  //Gender? _gender = Gender.man;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: Color(0xFF02AD58),
        title: Text('Профиль'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: _image == null
                              ? Image.asset('lib/assets/profile_pic.png')
                              : Image.file(_image!),
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              inputDataLabel(
                'Имя', 'Name', //_inputNameController
              ),
              inputDataLabel(
                'Surname', 'Surname', //_inputSurnameController
              ),
              pickerDateLabel(
                  'data birth',
                  '13 july 1993 y',
                  //_inputDateBirthController,
                  Icon(Icons.date_range_rounded)),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16, right: 16, left: 16, top: 148),
                child: RedButton(onTap: () {}, text: "Сохранить изменения"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputDataLabel(
    String smallText,
    String hintText, //TextEditingController controller
  ) {
    return SizedBox(
      height: 72,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              smallText,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            TextFormField(
              //controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pickerDateLabel(
      String smallText, String hintText, // TextEditingController controller,
      [Icon? icon]) {
    return SizedBox(
      height: 72,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              smallText,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            TextFormField(
              //controller: controller,
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                setState(() {
                  _dateBirth = picked;

                  //controller.text = _dateBirth!.toIso8601String();
                });
              },
              decoration: InputDecoration(
                  hintText: hintText, suffixIcon: icon == null ? null : icon),
            )
          ],
        ),
      ),
    );
  }
}
