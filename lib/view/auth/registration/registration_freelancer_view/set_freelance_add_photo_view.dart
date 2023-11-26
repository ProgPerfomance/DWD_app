import 'package:flutter/material.dart';

class SetFreelancerAddPhotoView extends StatelessWidget {
  const SetFreelancerAddPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}
