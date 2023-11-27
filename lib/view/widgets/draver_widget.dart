import 'package:flutter/material.dart';

class DraverWidget extends StatelessWidget {
  const DraverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 21, right: 20 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: Image.network(
                          "https://media.istockphoto.com/id/846685158/ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%81%D0%BB%D0%B8%D1%88%D0%BA%D0%BE%D0%BC-%D0%B3%D1%80%D0%BE%D0%BC%D0%BA%D0%BE-%D0%B4%D0%BB%D1%8F-%D1%87%D1%83%D0%B2%D0%B0%D0%BA%D0%B0.jpg?s=612x612&w=is&k=20&c=oalNKgW-U737WHg_WEmi0BTuZJb8DwtqOFPHoZJna2c=")
                          .image,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Никита",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Nikita1999@gmail.com",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "5",
                      style: TextStyle(color: Colors.amber),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                      size: 24,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            const Text(
              "Мой профиль",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Мои заказы",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Чат",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Поддержка",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "О приложении",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const PasswordChangeScreen(),
                  //     ));
                },
                child: const Text(
                  "Смена пароля",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Москва,ул. Ленина 44",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 300,
                  height: 50,
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.red)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Стать специалистом",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            )
          ],
        ),
      ),
    );
  }
}
