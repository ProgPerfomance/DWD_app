import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/controller/fill_adverb_controller.dart';
import 'package:untitled1/domain/ads/create_adverb.dart';
import 'package:untitled1/domain/user/auth/create_user.dart';
import 'package:untitled1/model/adverb/moto_adverb_model.dart';
import 'package:untitled1/view/main/ads/avito_list_view.dart';
import 'package:untitled1/view/view_model/adv_home_viewmodel.dart';
import 'package:untitled1/view/view_model/adv_moto_viewmodel.dart';

import '../../../view_model/adv_car_viewmodel.dart';
import '../../../widgets/custom_textfield_widget.dart';

FocusNode _focusNode = FocusNode();

TextEditingController _descriptionController = TextEditingController();
TextEditingController _priceController = TextEditingController();
TextEditingController _addressController = TextEditingController();
bool _phone = true;
bool _messages = true;

class CreateAdverbDescriptionView extends StatefulWidget {
  final String categoryName;
  final viewmodel;
   CreateAdverbDescriptionView(
      {super.key, required this.categoryName,  required this.viewmodel});

  @override
  State<CreateAdverbDescriptionView> createState() =>
      _CreateAdverbDescriptionViewState();
}

class _CreateAdverbDescriptionViewState
    extends State<CreateAdverbDescriptionView> {
  @override
  Widget build(BuildContext context) {
    final adverbModel = context.read<FillAdverbModel>();
    final createAdverb = context.read<CreateAdverb>();
    final userModel = context.read<CreateUser>();
    adverbModel.adverbModel.uid = userModel.uid;
    adverbModel.adverbModel.category = widget.categoryName;
    adverbModel.adverbModel.messages = true;
    adverbModel.adverbModel.phone = false;
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
                const SizedBox(
                  height: 12,
                ),
                TextField(
                  onChanged: (_) {
                    adverbModel.adverbModel.description = _descriptionController.text;
                  },
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/design/images/img.png'),
                    Image.asset('assets/design/images/img.png'),
                    Image.asset('assets/design/images/img.png'),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Цена',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFieldWidget(
                  onChange: (_) {
                    adverbModel.adverbModel.price = _priceController.text;
                  },
                    controller: _priceController,
                    text: 'Цена',
                    password: false),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Адрес',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFieldWidget(
                    onChange: (_) {
                      adverbModel.adverbModel.address = _addressController.text;
                    },
                    controller: _addressController,
                    text: 'Адрес',
                    password: false),
                const SizedBox(
                  height: 16,
                ),
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
                    Checkbox(
                        value: _phone,
                        onChanged: (value) {
                          _phone = !_phone;
                          adverbModel.adverbModel.phone = _phone;
                          setState(() {});
                        }),
                    const Text(
                      'По телефону',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _messages,
                        onChanged: (value) {
                          _messages = !_messages;
                          adverbModel.adverbModel.messages = _messages;
                          setState(() {});
                        }),
                    const Text(
                      'Сообщения',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                 widget.viewmodel ?? const SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    adverbModel.adverbModel.timestamp = DateTime.now();
                    createAdverb.createAdverb(adverbModel.adverbModel);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AvitoListView()));
                   print( adverbModel.adverbModel);
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF14F44),
                    ),
                    child: const Center(
                      child: Text('Создать',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
