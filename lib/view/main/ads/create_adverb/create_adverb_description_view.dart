import 'package:flutter/material.dart';

import '../../../widgets/custom_textfield_widget.dart';

FocusNode _focusNode = FocusNode();

TextEditingController _descriptionController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _addressController = TextEditingController();
bool _phone = false;
bool _messages = true;
class CreateAdverbDescriptionView extends StatefulWidget {
  final String categoryName;
  final viewmodel;
  const CreateAdverbDescriptionView({super.key, required this.categoryName, required this.viewmodel});

  @override
  State<CreateAdverbDescriptionView> createState() => _CreateAdverbDescriptionViewState();
}

class _CreateAdverbDescriptionViewState extends State<CreateAdverbDescriptionView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Внешний вид'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.categoryName,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff808080),
                  ),
                ),
                const Text(
                  'Опишите товар',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12,),
                TextField(
                  focusNode: _focusNode,
                  maxLines: 10,
                  minLines: 5,
                  maxLength: 1000,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Color(
                        0xFFCBCBCB,
                      ),
                    ),
                    hintText: 'Описание',
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/design/images/img.png'),
                    Image.asset('assets/design/images/img.png'),
                    Image.asset('assets/design/images/img.png'),
                  ],),
                const SizedBox(height: 16,),
                const Text(
                  'Цена',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16,),
                CustomTextFieldWidget(controller: _priceController, text: 'Цена', password: false),
                const SizedBox(height: 16,),
                const Text(
                  'Адрес',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16,),
                CustomTextFieldWidget(controller: _addressController, text: 'Адрес', password: false),
                const SizedBox(height: 16,),
                const Text(
                  'Тип связи',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Checkbox(value: _phone, onChanged: (value) {
                      _phone = !_phone;
                      setState(() {});
                    }),
                    const Text('По телефону',
                    style: TextStyle(
                      fontSize: 16,color: Color(0xff808080),
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: _messages, onChanged: (value) {
                      _messages = !_messages;
                      setState(() {});
                    }),
                    const Text('Сообщения',  style: TextStyle(
                      fontSize: 16,color: Color(0xff808080),
                    ),),
                  ],
                ),
                SizedBox(height: 12,),

              ],
            ),
          ),
        )),
      ),
    );
  }
}
