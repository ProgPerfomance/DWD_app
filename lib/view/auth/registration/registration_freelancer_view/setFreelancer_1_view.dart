import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_citys_list.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/citys_list_screen.dart';
import 'package:untitled1/view/auth/registration/registration_freelancer_view/set_freelance_add_photo_view.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _dateOfBurnController = TextEditingController();


class SetFreelancer1view extends StatelessWidget {
  String email;
  String password;
  SetFreelancer1view({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    final citysModel = context.watch<GetCitysList>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/design/images/arrowleft.png'),
                  const Text(
                    'Стать исполнителем',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image.asset('assets/design/images/cross.png'),
                ],
              ),
              const SizedBox(height: 9,),
              const Text('Как вас представлять заказчикам?', style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
              const SizedBox(height: 8,),
              const Text('Чтобы заказчики доверяли вам, укажите достоверную информацию.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff808080)
              ),),
              const SizedBox(height: 24,),
              const Text('Ваше ФИО', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                  color: Color(0xff808080),
              ),),
               TextField(
                controller: _nameController,
                style: const TextStyle(
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  hintText: 'ФИО',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )
                ),
              ),
              const SizedBox(height: 12,),
              const Text('Ваш Город', style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff808080),
              ),),
              const SizedBox(height: 12,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CitysListView()));
                    },
                    child: Text(citysModel.selectedCity,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                  Image.asset('assets/design/images/arrowright.png'),
                ],
              ),
             const SizedBox(height: 10,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width - 20,
                color: const Color(0xff808080),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      pickerMode: DateTimePickerMode.date,
                      initialDateTime:
                      DateTime.now().add(const Duration(days: 5)),
                      minDateTime: DateTime(1950, 1, 0, 0, 0, 0, 0, 0),
                      maxDateTime: DateTime.now(),
                      locale: DateTimePickerLocale.ru,
                      dateFormat: "dd MMMM yyyy",
                      onChange: (dateTime, selectedIndex) {
                        _dateOfBurnController.text = dateTime.toString();
                      },
                      onConfirm: (dateTime, selectedIndex) {
                        _dateOfBurnController.text = dateTime.toString();
                      },
                    );
                  },
                  child: TextField(
                    enabled: false,
                    controller: _dateOfBurnController,
                    decoration: const InputDecoration(
                      hintText: 'Дата рождения',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      )
                  ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height /3,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SetFreelancerAddPhotoView(name: _nameController.text,email: email, password: password, city: citysModel.selectedCity, date_of_burn: _dateOfBurnController.text,)));
                },
                child: Container(
                  height: 52,
                  width: MediaQuery.of(context).size.width - 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffF14F44),
                  ),
                  child: const Center(
                    child: Text('Продолжить', style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
