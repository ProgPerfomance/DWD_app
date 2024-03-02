import 'package:flutter/material.dart';
import 'package:untitled1/meneger_view/meneger_home_view.dart';
FocusNode _focusNode = FocusNode();
TextEditingController descriptionController = TextEditingController();
class ManagerAddCar3View extends StatefulWidget {
  const ManagerAddCar3View({super.key});

  @override
  State<ManagerAddCar3View> createState() => _ManagerAddCar3ViewState();
}

class _ManagerAddCar3ViewState extends State<ManagerAddCar3View> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
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
                const Text('3/3 Description',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),),
                const SizedBox(height: 24,),
                TextField(
                  focusNode: _focusNode,
                  maxLines: 10,
                  minLines: 5,
                  maxLength: 1000,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff1D1D1D),
                    hintStyle: const TextStyle(
                      color: Color(
                        0xFFCBCBCB,
                      ),
                    ),
                    hintText: '',
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
                  ),),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MenegerHomeView()));
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                      color: const Color(0xff8875FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}