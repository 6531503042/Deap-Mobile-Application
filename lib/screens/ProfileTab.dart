import 'dart:io'; // Add this line to import 'File'
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dentist_appointment/screens/home_page.dart';

class ProfileTab extends StatefulWidget {
  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<ProfileTab> {
  // Add TextEditingController for the text fields
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  // Add visibility variables for password fields
  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;

  // Add a variable to store the selected image
  XFile? _selectedImage;

  // Function to open the image picker
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: ModalRoute.of(context)!.settings.name != '/home' ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ) : null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Add your save functionality here
                // This will be triggered when the "Save" button is pressed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: _selectedImage != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(_selectedImage!.path)),
                              )
                            : const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://scontent.fbkk5-7.fna.fbcdn.net/v/t1.15752-9/417344535_1319060932092938_3317170497338053241_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeHMV4HJZ_HOsvwWv8_vILXmniFh6otDIfWeIWHqi0Mh9XwJizgBKzb7GTM8s3MtLYayCX6HQA1sGM1wehIiZV_z&_nc_ohc=u_gRc-aDkQUAX-VfGA8&_nc_ht=scontent.fbkk5-7.fna&oh=03_AdQV3WW2l4K31PG8OqiZzefJHZU_jC_T4BAYLYLAAJt0fg&oe=66093A21'),
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: const Icon(
                            Icons.camera,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Bio',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  controller: bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: oldPasswordController,
                      obscureText: !isOldPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Old Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isOldPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isOldPasswordVisible = !isOldPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: !isNewPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isNewPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isNewPasswordVisible = !isNewPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
