import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _uploadPost() {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _image != null) {
      print("Post uploaded!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description')),
            SizedBox(height: 10),
            _image == null
                ? Text("No image selected.")
                : Image.file(_image!, height: 150, width: 150),
            ElevatedButton(onPressed: _pickImage, child: Text("Select Image")),
            ElevatedButton(onPressed: _uploadPost, child: Text("Upload")),
          ],
        ),
      ),
    );
  }
}
