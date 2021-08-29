import 'package:get/get.dart';

class Controller extends GetxController {
  // var count = 1.obs;
  // increment() => count++;
  final count1 = 0.obs;
  final count2 = 0.obs;
  int get sum => count1.value + count2.value;
}
