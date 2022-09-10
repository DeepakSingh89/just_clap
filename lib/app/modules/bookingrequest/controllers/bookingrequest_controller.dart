import 'package:get/get.dart';

class BookingrequestController extends GetxController {
  final requestList = [
    {
      'name': 'Russel Taylor',
      'image': 'assets/user/user_1.jpg',
      'type': 'Home Cleaning',
      'time': '17 March | 01:00 PM'
    },
    {
      'name': 'Ellison Perry',
      'image': 'assets/user/user_3.jpg',
      'type': 'Home Cleaning',
      'time': '18 March | 09:00 AM'
    },
    {
      'name': 'Stella French',
      'image': 'assets/user/user_5.jpg',
      'type': 'Home Cleaning',
      'time': '18 March | 12:00 PM'
    }
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
