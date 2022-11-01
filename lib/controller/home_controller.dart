import 'package:ecommerceapp/model/ad_banner.dart';
import 'package:ecommerceapp/model/category.dart';
import 'package:ecommerceapp/model/product.dart';
import 'package:ecommerceapp/service/remote_service/remote_banner_service.dart';
import 'package:ecommerceapp/service/remote_service/remote_popular_category_service.dart';
import 'package:ecommerceapp/service/remote_service/remote_popular_product_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList = List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading =false.obs;
  RxBool isPopularCategoryLoading =false.obs;
  RxBool isPopularProductLoading =false.obs;

  @override
  void onInit() {
    getAdBanners();
    getPopularCategories();
    getPopularProducts();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banners before call api
      //call api
      var result = await RemoteBannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        //assign api result
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProducts() async {
    try {
      isPopularProductLoading(true);
      var result = await RemotePopularProductService().get();
      if (result != null) {
        //assign api result
        popularProductList.assignAll(popularProductListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      print(popularProductList.length);
      isPopularProductLoading(false);
    }
  }
}