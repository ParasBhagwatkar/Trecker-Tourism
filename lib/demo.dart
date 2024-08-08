import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  File? _processedImage;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await uploadImage(_image!);
    }
  }

  Future uploadImage(File image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://127.0.0.1:5000/remove_bg'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final bytes = await response.stream.toBytes();
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/processed_image.png';

      File file = File(filePath);
      await file.writeAsBytes(bytes);

      setState(() {
        _processedImage = file;
      });
    } else {
      print('Failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Removal App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Text('No image selected.') : Image.file(_image!),
            SizedBox(height: 20),
            _processedImage == null
                ? Text('No processed image.')
                : Image.file(_processedImage!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
