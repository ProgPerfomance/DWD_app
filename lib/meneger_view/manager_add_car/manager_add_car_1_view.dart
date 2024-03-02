import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg.dart';

import 'manager_add_car_2_view.dart';
final ImagePicker imagePicker = ImagePicker();
List<XFile> imageFileList = [];
class ManagerAddCar1View extends StatefulWidget {
  const ManagerAddCar1View({super.key});

  @override
  State<ManagerAddCar1View> createState() => _ManagerAddCar1ViewState();
}

class _ManagerAddCar1ViewState extends State<ManagerAddCar1View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
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
                        Navigator.pop(context);
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
                      'Car page',
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
              const SizedBox(height: 24,),
              const Text('1/3 Car info',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.white
              ),),
              SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                                itemCount: imageFileList.length+1,
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                                itemBuilder:
                                    (BuildContext context, int index) {
                                  return index == 0 ? GestureDetector(
                                    onTap: () {
                                      selectImages();
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 99,
                                      width: 99,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff1D1D1D),
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: const Color(0xff8875FF))
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset('assets/icons/add_sell_car.svg'),
                                          const Text('Add photo',style: TextStyle(
                                            color: Color(0xff8875FF),
                                          ),),
                                        ],
                                      ),
                                    ),
                                  ) : Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.file(
                                      File(imageFileList[index-1].path),
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }))),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: () async {
                  // В этой строке мы используем Future.wait, чтобы дождаться, пока все будущие
                  // Uint8List будут получены из списка Future<Uint8List>, который возвращает map
                  List<Uint8List> images = await Future.wait(imageFileList.map((e) async {
                    return await e.readAsBytes();
                  }).toList());

                  // Переход на следующий экран, вы должны также обновить ManagerAddCar2View
                  // чтобы он принимал List<Uint8List> вместо List
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManagerAddCar2View(images: images),
                    ),
                  );
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width - 32,
                  decoration: BoxDecoration(
                    color: const Color(0xff8875FF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text('Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> selectImages() async {
    try {
      final List<XFile> _selectedImages = await imagePicker.pickMultiImage();
      if (_selectedImages.isNotEmpty) {
        setState(() {
          imageFileList.addAll(_selectedImages);
        });
      }
    } catch (e) {
      // Обработка возможных ошибок
      debugPrint('Ошибка при выборе изображений: $e');
    }
  }
}
