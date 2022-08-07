import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_together/constants/color_constants.dart';
import 'package:pack_together/controllers/store_controller.dart';
import 'package:pack_together/widgets/card_main.dart';
import 'package:pack_together/widgets/side_drawer.dart';

class Home extends GetView<StoreController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.spaceCadet,
      appBar: AppBar(
        title: const Text("GetX Store"),
        actions: [],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: SideDrawer(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 90, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainCard(
                title: "Store Info",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Store Name:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        // Wrapped with Obx to observe changes to the storeName
                        // variable when called using the StoreController.
                        Obx(
                          () => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              // value parameter to be added with Obx or GetX
                              controller.storeName.value.toString(),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Store Followers:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const Text('With Obx'),
                              Obx(
                                () => Text(
                                  controller.followerCount.value.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const Text('With GetBuilder'),
                              GetBuilder<StoreController>(
                                builder: (newController) => Text(
                                  // value parameter is not needed with GetBuilder
                                  newController.storeFollowerCount.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Wrapped with GetBuilder to observe changes to the followerCount
                        // variable when called using the StoreController.
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            'Status:',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        // Wrapped with GetX<StoreController> to observe changes to the storeStatus
                        // variable when called using the StoreController.
                        GetX<StoreController>(
                          builder: (sController) => Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              sController.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: sController.storeStatus.value
                                      ? Colors.green.shade700
                                      : Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        /*Obx(
                          () => Flexible(
                            child: Text(
                              controller.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: controller.storeStatus.value
                                      ? Colors.green.shade700
                                      : Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            fit: FlexFit.tight,
                          ),
                        ),*/
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "No full-screen view",
                  );
                },
                child: MainCard(
                    title: "Followers",
                    body: Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.followerList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              controller.followerList[index].toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        },
                      ),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MainCard(
                  title: "Reviews",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.reviews.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.reviews[index].name),
                          subtitle: Text(controller.reviews[index].review),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
