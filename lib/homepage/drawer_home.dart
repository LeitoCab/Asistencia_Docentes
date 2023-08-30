import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CircleAvatarDrawer extends StatefulWidget {
  const CircleAvatarDrawer({Key? key}) : super(key: key);

  @override
  State<CircleAvatarDrawer> createState() => _CircleAvatarDrawerState();
}

class _CircleAvatarDrawerState extends State<CircleAvatarDrawer> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildUserAvatar(),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor:
              Colors.blue, // Cambia el color de fondo según tus preferencias
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? const Text(
                  "A",
                  style: TextStyle(
                    color: Colors
                        .white, // Cambia el color del texto según tus preferencias
                    fontSize: 40,
                  ),
                )
              : null,
        ),
        CircleAvatar(
          radius: 18,
          child: FloatingActionButton(
            onPressed: _getImageFromGallery,
            backgroundColor: Colors.black,
            mini: true,
            child: const Icon(Icons.add_a_photo_outlined),
          ),
        ),
      ],
    );
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
