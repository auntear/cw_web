import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:html'; // ใช้สำหรับ Flutter Web

class ManageIMG01 extends StatefulWidget {
  ManageIMG01({Key? key}) : super(key: key);

  @override
  _ManageIMG01State createState() => _ManageIMG01State();
}

class _ManageIMG01State extends State<ManageIMG01> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String? base64Image; // เก็บภาพในรูปแบบ base64
  String? imageName; // ชื่อไฟล์ภาพ

  Future<void> saveData() async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/addData'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': nameController.text,
        'age': ageController.text,
        'img': base64Image,
      }),
    );

    if (response.statusCode == 200) {
      print('Data saved successfully');
    } else {
      print('Failed to save data');
    }
  }

  void _pickImage() async {
    final FileUploadInputElement uploadInput = FileUploadInputElement();
    uploadInput.accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) async {
      final files = uploadInput.files;
      if (files?.isNotEmpty ?? false) {
        final reader = FileReader();
        reader.readAsDataUrl(files![0]);
        reader.onLoadEnd.listen((event) {
          setState(() {
            String? result = reader.result as String;
            base64Image = result.split(',').last; // แยก base64 ส่วนที่ต้องการ
            imageName = files[0].name;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Data to MySQL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 10),
            // แสดงภาพที่เลือก
            base64Image != null
                ? Text('Image selected: $imageName')
                : const Text('No image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveData,
              child: const Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
