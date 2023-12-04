import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/domain/get_orders_list.dart';
import 'package:untitled1/view/main/create_order_select_category.dart';
import 'package:untitled1/view/widgets/draver_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final watchModel = context.watch<GetOrdersList>();
    watchModel.getAllOrders();
    watchModel.getMyOrders();
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      drawer: const DraverWidget(),
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height / 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(Icons.person),
                          color: Colors.grey,
                          iconSize: 25,
                        );
                      }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 22,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(46)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 6.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.near_me,
                                color: Colors.grey,
                                size: 15,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Москва",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateOrderSelectCategory()));
                        },
                        child: const Text(
                          "Создать заявку",
                          softWrap: false,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.89,
                    height: 41,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12)),
                    child: MaterialButton(
                      onPressed: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => SearchScreen()));
                      },
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Поиск",
                            prefixIcon: Icon(Icons.search),
                            prefixStyle: TextStyle(color: Colors.grey)),
                      ),
                    )),
                const SizedBox(
                  height: 16,
                ),
                watchModel.myOrders.isEmpty ? const SizedBox() : const Text(
                  "Ваши заявки",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                watchModel.myOrders.isEmpty ? const SizedBox() :
                SizedBox(
                  height: 193,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: watchModel.myOrders.length,
                      itemBuilder: (context, index) {
                        final item = watchModel.myOrders[index];
                        List _orders = watchModel.myOrders[index]['orders'] ?? [];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14)),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    item['name'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${item['price']}€"),
                                      Row(
                                        children: List.generate(_orders.length, (index) => Image.network(_orders[index]['ava'], width: 30, height: 30,)),
                                      )
                                    ],
                                  ),
                                  trailing: FittedBox(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.near_me,
                                          color: Colors.grey,
                                          size: 12,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          item['address'],
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const Text(
                  "Популярное",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        ServicesWidget(
                          name: 'Ремонт\nи строительство',
                          image: 'image/builder.png',
                          color: const Color.fromRGBO(223, 248, 255, 1),
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 72,
                          sizew: 60,
                          sizeh: 60,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        ServicesWidget(
                          name: 'Красота\nи здоровье',
                          image: 'image/beat.png',
                          color: const Color.fromRGBO(253, 237, 239, 1),
                          width: MediaQuery.of(context).size.width * 0.44,
                          height: 72,
                          sizew: 90,
                          sizeh: 90,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: 72,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 242, 208, 1),
                              borderRadius: BorderRadius.circular(14)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 6.0, left: 6),
                              child: Stack(children: [
                                Image.asset(
                                  "image/Img.png",
                                  width: 110,
                                  height: 110,
                                  alignment: Alignment.bottomCenter,
                                ),
                                const Text(
                                  "Бытовые\nуслуги",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: 72,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(221, 251, 228, 1),
                              borderRadius: BorderRadius.circular(14)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 8),
                              child: Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Image.asset(
                                    "image/computer.png",
                                    width: 72,
                                    height: 72,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                                const Text(
                                  "Консультация",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: 72,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 216, 199, 1),
                              borderRadius: BorderRadius.circular(14)),
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 8),
                              child: Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Image.asset(
                                    "image/Van.png",
                                    width: 72,
                                    height: 72,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                                const Text(
                                  "Перевозки",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.89,
                      height: 72,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(221, 230, 251, 1),
                          borderRadius: BorderRadius.circular(14)),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Аренда или продажа",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Недвижимости, автомобиля, вещей",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Image.asset("image/House.png")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 55,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(46)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Еще",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 12,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Последние заявки",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 193,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: watchModel.orders.length,
                    itemBuilder: (context, index) {
                      final item = watchModel.orders[index];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14)),
                            child: ListTile(
                              title: Text(
                                item['name'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text("${item['price']}€"),
                              trailing: FittedBox(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.near_me,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      item['address'],
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Последние услуги ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 193,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14)),
                            child: const ListTile(
                              title: Text(
                                "Барбер",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text("20 €"),
                              trailing: FittedBox(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.near_me,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "Москва,ул. Ленина 44",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final double width;
  final double height;
  final double sizew;
  final double sizeh;
  const ServicesWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.color,
    required this.width,
    required this.height,
    required this.sizew,
    required this.sizeh,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Image.asset(
                image,
                width: sizew,
                height: sizeh,
              )
            ],
          ),
        ),
      ),
    );
  }
}
