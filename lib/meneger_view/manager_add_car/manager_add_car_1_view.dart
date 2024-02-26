import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
final ImagePicker imagePicker = ImagePicker();
List<XFile>? imageFileList = [];
class ManagerAddCar1View extends StatefulWidget {
  const ManagerAddCar1View({super.key});

  @override
  State<ManagerAddCar1View> createState() => _ManagerAddCar1ViewState();
}

class _ManagerAddCar1ViewState extends State<ManagerAddCar1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff8875FF),
                        ),
                      ),
                    ),
                    const Text(
                      'My cars',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Color(0xffffffff),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff7A7A7A), //0xff7A7A7A
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text('1/3 Car info',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white
              ),),
              TextButton(onPressed: () {
                selectImages();
              }, child: Text('fff')),
              SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                itemCount: imageFileList!.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.file(
                                      File(imageFileList![index].path),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  selectImages() async {
    final List<XFile> _selectedImages = await imagePicker.pickMultiImage();
    if (_selectedImages.isNotEmpty) {
      imageFileList!.addAll(_selectedImages);
      setState(() {});
    }
  }
}
