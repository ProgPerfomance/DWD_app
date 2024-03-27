import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/server_routes.dart';

import '../../model/transmission_model.dart';
import 'manager_add_car_2_view.dart';

final TextEditingController _modelController = TextEditingController();
final TextEditingController _priceUSDController = TextEditingController();
final TextEditingController _priceAEDController = TextEditingController();
final TextEditingController _colorController = TextEditingController();
final TextEditingController _miliegeController = TextEditingController();
final TextEditingController _regionalSpecsController = TextEditingController();
final TextEditingController _transmissionController = TextEditingController();
final TextEditingController _motorRimController = TextEditingController();
final TextEditingController _bodyController = TextEditingController();
final TextEditingController _guranteeController = TextEditingController();
final TextEditingController _serviceContactController = TextEditingController();
final TextEditingController _brandController = TextEditingController();
final TextEditingController _yearController = TextEditingController();
bool _financeNeg = false;
FocusNode _focusNode = FocusNode();
TextEditingController _descriptionController = TextEditingController();
class ManagerEditCar extends StatefulWidget {
  final model;
  final priceUSD;
  final priceAED;
  final color;
  final miliage;
  final regionalSpecs;
  final motorTrim;
  final body;
  final qurantee;
  final sericeContact;
  final brand;
  final year;
  final transmission;
  final description;
  final id;
  const ManagerEditCar({
    super.key,
    required this.color,
    required this.model,
    required this.brand,
    required this.year,
    required this.description,
    required this.body,
    required this.motorTrim,
    required this.regionalSpecs,
    required this.miliage,
    required this.priceAED,
    required this.priceUSD,
    required this.qurantee,
    required this.transmission,
    required this.id,
    required this.sericeContact,
  });

  @override
  State<ManagerEditCar> createState() => _ManagerEditCarState();
}

class _ManagerEditCarState extends State<ManagerEditCar> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
          backgroundColor: const Color(0xff121212),
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                            color: Color(0xff7A7A7A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '2/3 Car info',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: Column(children: [
                      Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Brand",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: const Color(0x00212121),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ExpansionTile(
                                title: Text(
                                  _brandController.text,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: List.generate(
                                    cars.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            _brandController.text = cars[index];
                                            setState(() {});
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  cars[index],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                              )),
                        ),
                      ]),
                      ManagerTextFieldBlock(
                          controller: _modelController, label: "Model"),
                      ManagerTextFieldBlock(
                          controller: _priceAEDController, label: "Price AED"),
                      ManagerTextFieldBlock(
                          controller: _priceUSDController, label: "Price USD"),
                      ManagerTextFieldBlock(
                          controller: _colorController, label: "Color"),
                      ManagerTextFieldBlock(
                          controller: _yearController, label: "Year"),
                      ManagerTextFieldBlock(
                          controller: _miliegeController, label: "Mileage"),
                      Column(children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Transmission",
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: const Color(0x00212121),
                                  borderRadius: BorderRadius.circular(12)),
                              child: ExpansionTile(
                                title: Text(
                                  _transmissionController.text,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                children: List.generate(
                                    transmissions.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            _transmissionController.text =
                                                transmissions[index];
                                            setState(() {});
                                          },
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Text(
                                                  transmissions[index],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                              )),
                        ),
                      ]),
                      ManagerTextFieldBlock(
                          controller: _regionalSpecsController,
                          label: "Regional specs"),
                      ManagerTextFieldBlock(
                          controller: _motorRimController, label: "Motor trim"),
                      ManagerTextFieldBlock(
                          controller: _bodyController, label: "Body"),
                      ManagerTextFieldBlock(
                          controller: _guranteeController, label: "Guarantee"),
                      ManagerTextFieldBlock(
                          controller: _serviceContactController,
                          label: "Service contract"),
                      Row(
                        children: [
                          Checkbox(
                              value: _financeNeg,
                              onChanged: (_) {
                                _financeNeg = !_financeNeg;
                                setState(() {});
                              }),
                          const Text(
                            'finance neg',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ])),
                const SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    focusNode: _focusNode,
                    maxLines: 10,
                    minLines: 5,
                    maxLength: 1000,
                    controller: _descriptionController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff1D1D1D),
                      hintStyle: const TextStyle(
                        color: Color(
                          0xFFCBCBCB,
                        ),
                      ),
                      hintText: 'Description',
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
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () async {
                      Dio dio = Dio();
                    await  dio.post('${ServerRoutes.host}/updateManagerCar',
                      data:
                      {
                        'id': widget.id,
                        'brand': _brandController.text,
                        'model': _modelController.text,
                        'year': _yearController.text,
                        'price_usd': _priceUSDController.text,
                        'price_aed': _priceAEDController.text,
                        'color': _colorController.text,
                        'killometers': _miliegeController.text,
                        'regional_specs': _regionalSpecsController.text,
                        'transmission': _transmissionController.text,
                        'motor_trim': _motorRimController.text,
                        'body': _bodyController.text,
                        'guarantee': _guranteeController.text,
                        'service_contact': _serviceContactController.text,
                        'description': _descriptionController.text,
                        'cash': _financeNeg
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: BoxDecoration(
                        color: const Color(0xff8875FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
  @override
  void initState() {
    _modelController.text = widget.model;
    _priceUSDController.text = widget.priceUSD;
    _priceAEDController.text = widget.priceAED;
    _colorController.text = widget.color;
    _miliegeController.text = widget.miliage;
    _regionalSpecsController.text = widget.regionalSpecs;
    _transmissionController.text = widget.transmission;
    _motorRimController.text = widget.motorTrim;
    _bodyController.text = widget.body;
    _guranteeController.text = widget.qurantee;
    _serviceContactController.text = widget.sericeContact;
    _brandController.text = widget.brand;
    _yearController.text = widget.year;
    _descriptionController.text = widget.description;
    super.initState();
  }
}
