import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controller/services_controller.dart';

TextEditingController titleController = TextEditingController();



class EditServiceManager extends GetView<ServicesController> {
  final title;
  final id;

  bool isChecked = false;
  EditServiceManager({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    controller.getServiceInfo(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xff8875FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/arrowleft.png')),
                  ),
                  const SizedBox(
                    height: 8.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41.0),
                    child: Row(
                      children: [
                        const Text(
                          '39\$',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        GestureDetector(
                            onTap: (){},
                            child: const Icon(Icons.edit, color: Colors.yellow,)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41.0),
                    child: Stack(
                      children: [
                        Image.asset('assets/line.png'),
                        Row(
                          children: [
                            const Text(
                              'was 49\$',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffffffff),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){},
                                child: const Icon(Icons.edit, color: Colors.yellow,)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 238,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 61,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "What's Included",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xffffffff),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog<void>(
                                    useSafeArea: false,
                                    context: context,
                                    barrierDismissible:
                                    false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return EditCarAlert(title: '', included: true, sid: id, update: false);
                                    });
                              }, icon: const Icon(Icons.add,color: Colors.white,)),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Obx(
                        () => Column(
                          children: List.generate(
                            controller.included.length,
                            (index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.included[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff)),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: (){},
                                        child: const Icon(Icons.edit, color: Colors.yellow,)),
                                    GestureDetector(
                                        onTap: (){
                                          controller.deleteServiceBlock(id:    controller.included[index]['id'],sid: id);
                                        },
                                        child: const Icon(Icons.delete,color: Colors.red,)),
                                  ],
                                )
                              ],
                            ),
                          ).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "What's NOT Included",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xffffffff),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog<void>(
                                    useSafeArea: false,
                                    context: context,
                                    barrierDismissible:
                                    false, // user must tap button!
                                    builder: (BuildContext context) {
                                      return EditCarAlert(title: '', included: false, sid: id, update: false);
                                    });
                              }, icon: const Icon(Icons.add,color: Colors.white,)),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Obx(
                        () => Column(
                          children: List.generate(
                            controller.notIncluded.length,
                            (index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.notIncluded[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xffffffff)),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){},
                                        child: const Icon(Icons.edit, color: Colors.yellow,)),
                                    GestureDetector(
                                      onTap: (){
                                        controller.deleteServiceBlock(id:    controller.notIncluded[index]['id'],sid: id);
                                      },
                                        child: const Icon(Icons.delete,color: Colors.red,)),
                                  ],
                                ),
                              ],
                            ),
                          ).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                    ],
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


class EditCarAlert extends GetView<ServicesController> {
  final title;
  final bool included;
  final sid;
  final bool update;
  const EditCarAlert({super.key, required this.title,required this.included, required this.sid, required this.update});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    return AlertDialog(
      backgroundColor:
      const Color(0xff2D2D2D).withOpacity(0),
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(
          horizontal: 12),
      content: Container(
          height: 238,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff2D2D2D)
                .withOpacity(0.9),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'Title',
                  style: TextStyle(
                    color: Colors.white
                        .withOpacity(0.87),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context)
                      .size
                      .width -
                      64,
                  color: const Color(0xff979797),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: titleController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                    const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xff535353,
                      ),
                    ),
                    hintText: 'Your name',
                    isDense: true,
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff7A7A7A),
                          width: 1),
                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                    ),
                    focusedBorder:
                    OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(
                        12,
                      ),
                      borderSide: const BorderSide(
                          color: Color(0xff7A7A7A),
                          width: 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 52,
                        width:
                        MediaQuery.of(context)
                            .size
                            .width /
                            2 -
                            52,
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight:
                              FontWeight.w400,
                              fontSize: 16,
                              color:
                              Color(0xff8875FF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.createServiceBlock(title: titleController.text, sid: sid, included: included);
                        titleController.clear();
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 52,
                        width:
                        MediaQuery.of(context)
                            .size
                            .width /
                            2 -
                            52,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              12),
                          color: const Color(
                              0xff8875FF),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:
                              FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );;
  }
}
