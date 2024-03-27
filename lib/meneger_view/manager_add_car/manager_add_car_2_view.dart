import 'package:flutter/material.dart';
import '../../model/transmission_model.dart';
import 'manager_add_car_3_view.dart';

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
bool financeNeg = false;

class ManagerAddCar2View extends StatefulWidget {
  final images;
  const ManagerAddCar2View({super.key, required this.images});

  @override
  State<ManagerAddCar2View> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<ManagerAddCar2View> {
  Widget build(BuildContext context) {
    return Scaffold(
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
                                          setState(() {});
                                          _transmissionController.text =
                                              transmissions[index];
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
                            value: financeNeg,
                            onChanged: (_) {
                              financeNeg = !financeNeg;
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
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ManagerAddCar3View(
                                  financeNeg: financeNeg,
                                  model: _modelController.text,
                                  motorTrim: _motorRimController.text,
                                  price_USD: _priceUSDController.text,
                                  color: _colorController.text,
                                  gurantee: _guranteeController.text,
                                  miliege: _miliegeController.text,
                                  regionalSpecs: _regionalSpecsController.text,
                                  serviceContact:
                                      _serviceContactController.text,
                                  body: _bodyController.text,
                                  transmission: _transmissionController.text,
                                  brand: _brandController.text,
                                  photos: widget.images,
                                  price_AED: _priceAEDController.text,
                                  year: _yearController.text,
                                  name:
                                      '${_brandController.text} ${_modelController.text}',
                                )));
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
              )
            ],
          ),
        ));
  }
}

class ManagerTextFieldBlock extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const ManagerTextFieldBlock(
      {super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(label,
                style: const TextStyle(
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
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.only(start: 10)),
              controller: controller,
            )),
      ),
    ]);
  }
}
