import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import '../profile/profile_view.dart';
import 'open_sevise_view.dart';

class ServiseView extends StatelessWidget {
  const ServiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        centerTitle: true,
        title: const Text(
          'DWD',
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: Color(0xffffffff)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );
              },
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/dwd_logo.jpeg'),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Special offers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 33,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OpenServiseView(
                                              id: 0,
                                              special: true,
                                              title: 'Major Service',
                                            )));
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == 0
                                      ? const Color(0xff2B9129)
                                      : Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Major Service',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 24,
                                          color: index == 0
                                              ? const Color(0xffffffff)
                                              : const Color(0xff8875FF),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        '39 AED',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: [
                                          Image.asset('assets/line.png'),
                                          Text(
                                            'was 49 AED',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: index == 0
                                                  ? const Color(0xffffffff)
                                                  : const Color(0xff7A7A7A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Service',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceButton(
                        text: 'General\nrepair',
                        icon: 'assets/icons/general_repair.svg',
                        id: 0,
                      ),
                      ServiceButton(
                        text: 'Interval\nservice',
                        icon: 'assets/icons/interval_service.svg',
                        id: 1,
                      ),
                      ServiceButton(
                        text: 'Recovery',
                        icon: 'assets/icons/recovery.svg',
                        id: 2,
                      ),
                      ServiceButton(
                        text: 'Wheels and\ntires',
                        icon: 'assets/icons/general2.svg',
                        id: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ), //  text: 'General\nrepair','Interval\nservice', 'Gearbox\nrepair','Wheels','Brakes','Battery', 'AC repair', 'Wrapping &\nPPF',   text: 'Tinting', text: 'Detailing',
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceButton(
                        text: 'Brakes',
                        icon: 'assets/icons/brakes.svg',
                        id: 4,
                      ),
                      ServiceButton(
                        text: 'Battery',
                        icon: 'assets/icons/battary.svg',
                        id: 5,
                      ),
                      ServiceButton(
                        text: 'AC repair',
                        icon: 'assets/icons/ac.svg',
                        id: 6,
                      ),
                      ServiceButton(
                        text: 'Wrapping &\nPPF',
                        icon: 'assets/icons/ppf.svg',
                        id: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceButton(
                        text: 'Tinting',
                        icon: 'assets/icons/tinting.svg',
                        id: 8,
                      ),
                      ServiceButton(
                        text: 'Detailing',
                        icon: 'assets/icons/detaling.svg',
                        id: 9,
                      ),
                      ServiceButton(
                        text: 'Insurance',
                        icon: 'assets/icons/insurance.svg',
                        id: 8,
                      ),
                      ServiceButton(
                        text: 'Car Rent',
                        icon: 'assets/icons/carrent.svg',
                        id: 8,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 73,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 24,
                    height: 51,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff363636)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/urgent_car.svg'),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'SOS service',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 73,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceButton extends StatelessWidget {
  final icon;
  final text;
  final int id;
  const ServiceButton(
      {super.key, required this.text, required this.icon, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OpenServiseView(
                      id: id,
                      special: false,
                      title: text,
                    )));
      },
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xff363636),
            ),
            child: Center(
              child: SvgPicture.asset(icon),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
  }
}

//'Wheels','Brakes','Battery', 'AC repair', 'Wrapping &\nPPF',   text: 'Tinting', text: 'Detailing',
// List strings = [
//   insert into servises (id, name, price, low_price) values (0, 'General repair', 39, 23);
//   insert into servises (id, name, price, low_price) values (1, 'Interval service', 39, 23);
//   insert into servises (id, name, price, low_price) values (2, 'Gearbox repair', 39, 23);
//   insert into servises (id, name, price, low_price) values (3, 'Wheels', 39, 23);
//   insert into servises (id, name, price, low_price) values (4, 'Brakes', 39, 23);
//   insert into servises (id, name, price, low_price) values (5, 'Battery', 39, 23);
//   insert into servises (id, name, price, low_price) values (6, 'AC repair', 39, 23);
//   insert into servises (id, name, price, low_price) values (7, 'Wrapping & PPF', 39, 23);
//   insert into servises (id, name, price, low_price) values (8, 'Tinting', 39, 23);
//   insert into servises (id, name, price, low_price) values (9, 'Detailing', 39, 23);
// ];
