import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../layouts/layout_files.dart';
import '../layouts/layout_home.dart';


class VideoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
            index: controller.selectedIndex.value,
            children: [
              LayoutHome(),
              LayoutFiles(),
            ],
          );
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (Index) {
            controller.changeIndex(Index);
          },
          selectedItemColor: Colors.blue,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                controller.selectedIndex.value == 0.0
                    ? Icons.home
                    : Icons.home_outlined,
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(controller.selectedIndex.value == 1.0
                  ? Icons.file_copy
                  : Icons.file_copy_outlined),
              label: 'Files',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
