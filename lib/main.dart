import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtex_demo/controller.dart';

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Demo"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black54, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                Get.snackbar(
                  "標題", "網路錯誤!",
                  colorText: Colors.white, backgroundColor: Colors.black54,
                  duration: Duration(milliseconds: 1500), //開始到結束的時間
                  snackPosition: SnackPosition.TOP,
                  titleText: Text(
                    "這個是新標題",
                    style: TextStyle(color: Colors.red),
                  ),
                  messageText: Column(
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      Icon(Icons.remove, color: Colors.white),
                      Icon(Icons.list, color: Colors.white),
                    ],
                  ),
                  icon: Icon(Icons.usb_rounded, color: Colors.white, size: 35),
                  borderWidth: 2.0, borderColor: Colors.red,
                );
              },
              child: Text("snackbar")),
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
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      )),
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(child: Text("${c.count}")));
  }
}
