import 'package:flutter/material.dart';
import 'package:untitled1/model/ads_model.dart';

class AdverbView extends StatelessWidget {
  final AdverbModel adverbModel;
  const AdverbView({super.key, required this.adverbModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Объявление номер ${adverbModel.id}'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 260,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                children: [
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft:  Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.image, color: Colors.grey.shade700, size: 70,),
                    ),
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft:  Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.image, color: Colors.grey.shade700, size: 70,),
                    ),
                  ),
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft:  Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.image, color: Colors.grey.shade700, size: 70,),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
