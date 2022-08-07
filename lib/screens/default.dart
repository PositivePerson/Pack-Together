import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_together/controllers/store_controller.dart';
import 'package:pack_together/controllers/theme_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Default extends StatelessWidget {
  Default({Key? key}) : super(key: key);
  final storeController = Get.find<StoreController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text("Add Follower Count"),
        actions: [
          SizedBox(
            width: 75,
            child: IconButton(
              // iconSize: 75.0,
              icon: Text(
                "History",
                style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              onPressed: () => debugPrint("Clicked 'History'"),
            ),
          ),
          // TextButton(
          //   onPressed: () => debugPrint("Clicked 'History'"),
          //   child: Text(
          //     "History",
          //     style: TextStyle(color: Theme.of(context).colorScheme.secondary),
          //   ),
          // ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/world.svg',
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                // height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
          Container(
            // padding: const EdgeInsets.fromLTRB(24, 72, 24, 0),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          // horizontal: 40,
                        ),
                      ),
                      onPressed: () => debugPrint("Clicked 'Incoming'"),
                      child: Text(
                        "Incoming (${storeController.incomingTrips.value.toString()})",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                      ),
                      onPressed: () => debugPrint("Clicked 'Current'"),
                      child: Text(
                        "Current (${storeController.incomingTrips.value.toString()})",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                    ),
                    onPressed: () => debugPrint("Clicked 'Add'"),
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
