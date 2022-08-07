import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pack_together/app_theme.dart';
import 'package:pack_together/constants/color_constants.dart';
import 'package:pack_together/controllers/theme_controller.dart';

class SideDrawer extends StatelessWidget {
  SideDrawer({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'GetX Store',
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.change_circle_sharp,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
              title: Text(
                "Default Screen",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue,
                ),
              ),
              onTap: () {
                // closes the drawer and goes to another screen
                Get.offAndToNamed('/default');
                //Get.back();
              }),
          ListTile(
              leading: Icon(
                Icons.change_circle_sharp,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
              title: Text(
                "Change Store Name",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Get.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue,
                ),
              ),
              onTap: () {
                // closes the drawer and goes to another screen
                Get.offAndToNamed('/edit_name');
                //Get.back();
              }),
          ListTile(
            leading: Icon(
              Icons.add_reaction_sharp,
              color:
                  Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "Add Followers",
              style: TextStyle(
                fontSize: 18.0,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/add_followers'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_task_sharp,
              color:
                  Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "Increment Followers",
              style: TextStyle(
                fontSize: 18.0,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/edit_follower_count'),
          ),
          ListTile(
            leading: Icon(
              Icons.toggle_on_sharp,
              color:
                  Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "Toggle Store Status",
              style: TextStyle(
                fontSize: 18.0,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/toggle_status'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_comment_sharp,
              color:
                  Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "Add Reviews",
              style: TextStyle(
                fontSize: 18.0,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/add_reviews'),
          ),
          ListTile(
            leading: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
            title: Text(
              Get.isDarkMode ? "Dark Mode ON" : "Light Mode ON",
              style: TextStyle(
                fontSize: 18.0,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              if (Get.isDarkMode) {
                themeController.changeTheme(Themes.lightTheme);
                themeController.saveTheme(false);
              } else {
                themeController.changeTheme(Themes.darkTheme);
                themeController.saveTheme(true);
              }
            },
          ),
          /*ListTile(
            leading: Icon(
              Icons.update_sharp,
              color:
                  Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              "Update Menu",
              style: TextStyle(
                fontSize: 18.0,
                color:
                    Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/update_menu'),
          ),*/
        ],
      ),
    );
  }
}
