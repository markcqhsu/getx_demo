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
