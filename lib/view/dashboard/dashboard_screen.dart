import 'package:ecommerceapp/controller/dashboard_controller.dart';
import 'package:ecommerceapp/view/category/category_screen.dart';
import 'package:ecommerceapp/view/home/home_screen.dart';
import 'package:ecommerceapp/view/product/prdocut_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) =>  Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
                   HomeScreen(),
             const ProductScreen(),
             const CategoryScreen(),
              Container(
                color: Colors.orange,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 0.2
              ),
            ),
          ),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: TextStyle(fontSize: 11),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showUnselectedLabels: true,
            currentIndex: controller.tabIndex,
            onTap: (val)
            {
              controller.updateIndex(val);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined),
                  label: 'Category'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Menu'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Account'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
