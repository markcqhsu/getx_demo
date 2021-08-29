import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtex_demo/controller.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: "/",
    getPages: [
      GetPage(name: "/", page: () => const Home()),
      GetPage(
        name: "/other",
        page: () => Other(),
      ),
      GetPage(name: "/login", page: () => const Login()),
    ],
    routingCallback: (routing) => {print(routing!.current)}, //* 可以用來判斷用戶的狀態
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build...");
    final controller = Get.put(Controller());
    final user = User(name: "jas", age: 20).obs;


    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<Controller>(
              builder: (controller) {
                print("count 1  rebuild");
                return Text("${controller.count1.value}");
              },
            ),
            ElevatedButton(
              onPressed: () {
                controller.count1.value++;
              },
              child: Text("count1"),
            ),

            Obx(()=>Text("name is ${user.value.name}"),),
            ElevatedButton(
              onPressed: () {
                controller.count2.value++;
              },
              child: Text("count2"),
            ),

            Obx(
              ()=> Text("name is ${user.value.name}"),
            ),
            Obx(
              ()=> Text("age is ${user.value.age}"),
            ),
            ElevatedButton(
              onPressed: () {
                user.update((user)=>{
                  user!.name="miles",
                  user.age = 20,
                });
              },
              child: Text("Update User"),
            ),


            ElevatedButton(
              onPressed: () {
                Get.toNamed("/login");
              },
              child: Text("Login Page"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    height: 180,
                    color: Colors.white,
                    child: ListView(
                      children: const [
                        ListTile(
                          leading: Icon(
                            Icons.account_box,
                            size: 35,
                            color: Colors.red,
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          title: Text("重啟"),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.shopping_cart,
                            size: 35,
                            color: Colors.red,
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          title: Text("取消"),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.list_alt,
                            size: 35,
                            color: Colors.red,
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          title: Text("關機"),
                        ),
                      ],
                    ),
                  ),
                  // enableDrag: false,
                  // isDismissible: false, //是否可以關掉畫面
                );
              },
              child: const Text("bottomsheet"),
            ),
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
                  barrierDismissible: false, //點擊畫面就會關閉Dialog
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
            // GestureDetector(
            //   onTap: () {
            //     Get.toNamed("/other",
            //         // () => Other(),
            //         // transition: Transition.native, //* native 根據設備做變化
            //         arguments: {"name": "1111", "age": "20"});
            //   },
            //   child: Container(
            //       height: 200,
            //       width: 200,
            //       color: Colors.red,
            //       child: Align(
            //         alignment: Alignment.bottomCenter,
            //         child: Obx(() => Text(
            //               controller.count.toString(),
            //               style: const TextStyle(
            //                   fontSize: 50, color: Colors.white),
            //             )),
            //       ),),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // controller.increment();
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
    final result = Get.arguments;
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
      // body: Center(child: Text("${c.count}" + Get.arguments["name"])),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("這個是登入介面"),
        ),
      ),
    );
  }
}

class User{
  User({required this.name, required this.age});
  String name;
  int age;
}