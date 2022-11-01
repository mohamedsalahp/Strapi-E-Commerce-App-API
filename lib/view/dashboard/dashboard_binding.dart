import 'package:ecommerceapp/controller/category_controller.dart';
import 'package:ecommerceapp/controller/dashboard_controller.dart';
import 'package:ecommerceapp/controller/home_controller.dart';
import 'package:ecommerceapp/controller/product_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings
{
  @override
  void dependencies() 
  {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
  }
}