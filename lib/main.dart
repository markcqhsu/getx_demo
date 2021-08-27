import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtex_demo/controller.dart';

void main() {
  runApp(const GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Demo"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: "標題",
                titleStyle: const TextStyle(color: Colors.red),
                content: Column(
                  children: const [
                    Text("這個是模式的數據"),
                    Text("這個是模式的數據"),
                    Text("這個是模式的數據"),
                    Text("這個是模式的數據"),
                    Text("這個是模式的數據"),
                  ],
                ),
                // textCancel: "取消",
                // cancelTextColor: Colors.greenAccent,
                // textConfirm: "確認",
                // confirmTextColor: Colors.white,
                // buttonColor: Colors.greenAccent,
                // onCancel: (){
                //   Get.back();
                // }
                cancel: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("取消"),
                ),
                confirm: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    Get.snackbar("提示", "消息已確認");
                  },
                  child: Text(
                    "確認",
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.white, // foreground
                  ),
                ),
                // backgroundColor: Colors.grey,
                barrierDismissible: false,//點擊畫面就會關閉Dialog

              );
            },
            child: const Text("Dialog"),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black54, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Get.snackbar(
                  "標題", "網路錯誤!",
                  colorText: Colors.white, backgroundColor: Colors.black54,
                  duration: const Duration(milliseconds: 1500), //開始到結束的時間
                  snackPosition: SnackPosition.TOP,
                  titleText: const Text(
                    "這個是新標題",
                    style: TextStyle(color: Colors.red),
                  ),
                  messageText: Column(
                    children: const [
                      Icon(Icons.add, color: Colors.white),
                      Icon(Icons.remove, color: Colors.white),
                      Icon(Icons.list, color: Colors.white),
                    ],
                  ),
                  icon: const Icon(Icons.usb_rounded,
                      color: Colors.white, size: 35),
                  borderWidth: 2.0, borderColor: Colors.red,
                );
              },
              child: const Text("snackbar")),
          GestureDetector(
            onTap: () {
              Get.to(Other());
            },
            child: Container(
                height: 200,
                width: 200,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(() => Text(
                        controller.count.toString(),
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      )),
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.increment();
        },
      ),
    );
  }
}

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // 访问更新后的计数变量
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child: Text("${c.count}")));
  }
}
