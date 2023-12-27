import 'package:flutter/material.dart';

import '../../../widgets/custom_textfield_widget.dart';
import '../../../widgets/top_row_widget.dart';
import 'create_adverb_description_view.dart';

TextEditingController _nameController = TextEditingController();

class CreateAdverbSetNameView extends StatelessWidget {
  final String categoryName;
  const CreateAdverbSetNameView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopRowWidget(text: 'Название заявки'),
                const SizedBox(
                  height: 16,
                ),
                Text(categoryName, style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xff808080),
                ),),
                const Text('Как будет называться объявление?', style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),),
                const SizedBox(height: 12,),
                CustomTextFieldWidget(controller: _nameController, text: 'Введите название объявления', password: false),
                SizedBox(height: MediaQuery.of(context).size.height / 1.7,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      _nameController.text.isEmpty ? null : null; Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAdverbDescriptionView(categoryName: categoryName, viewmodel: null,)));
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: _nameController.text.isEmpty ? const Color(0xffEBEBEB) : const Color(0xffF14F44),
                      ),
                      child: Center(
                        child: Text('Продолжить', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: _nameController.text.isEmpty ? Colors.black : Colors.white,
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
