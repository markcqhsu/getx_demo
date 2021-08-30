import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class Controller extends GetxController {
  // var count = 1.obs;
  // increment() => count++;
  final count1 = 0.obs;
  final count2 = 0.obs;
  int get sum => count1.value + count2.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      
    //* 可以用來計算購物車價格, 購買數量等等
    // ever(count1, (callback) {
    //   print(callback);
    // });
    //* 可以用來保存用戶訊息
    // once(count1, (callback) {
    //   print(callback.toString() + "_once demo");
    // });

    //搜索場景
    debounce(count1, (callback) {
      print(callback.toString() + "_debounce demo");
    }, time: Duration(seconds: 3));
  }
}
