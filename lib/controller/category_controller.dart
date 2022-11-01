import 'package:ecommerceapp/model/category.dart';
import 'package:ecommerceapp/service/remote_service/remote_category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
{
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}