import 'package:flutter/material.dart';
import 'package:untitled1/view/servise/book_service_view.dart';

class OpenServiseView extends StatelessWidget {
  final bool special;
  final String title;
  final int id;
  const OpenServiseView(
      {super.key,
      required this.special,
      required this.title,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: special == true
              ? const Color.fromRGBO(57, 198, 54, 1)
              : const Color(0xff8875FF),
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 41.0),
                    child: Text(
                      '39\$',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
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
                        const Text(
                          'was 49\$',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffffffff),
                          ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 39.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 61,
                      ),
                      const Text(
                        "What's Included",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Column(
                        children: [
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      const Text(
                        "What's NOT Included",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xffffffff),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Column(
                        children: [
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          ),
                          Text(
                            'Oil Filter',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0xffffffff)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookServiceView(
                                        id: id,
                                      )));
                        },
                        child: Container(
                          height: 52,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: const Color(0xff8875FF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Book',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffffffff)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
