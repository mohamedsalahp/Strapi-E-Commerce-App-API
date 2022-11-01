import 'package:ecommerceapp/component/main_header.dart';
import 'package:ecommerceapp/controller/controllers.dart';
import 'package:ecommerceapp/view/home/components/carousel_slider/carousel_loading.dart';
import 'package:ecommerceapp/view/home/components/carousel_slider/carousel_slider_view.dart';
import 'package:ecommerceapp/view/home/components/popular_category/popular-category.dart';
import 'package:ecommerceapp/view/home/components/popular_category/popular_category_card.dart';
import 'package:ecommerceapp/view/home/components/popular_category/popular_category_loading.dart';
import 'package:ecommerceapp/view/home/components/popular_product/popular_product.dart';
import 'package:ecommerceapp/view/home/components/popular_product/popular_product_loading.dart';
import 'package:ecommerceapp/view/home/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children:
                [
                  Obx(() {
                    if (homeController.bannerList.isNotEmpty)
                    {
                      return CarouselSliderView
                        (
                          bannerList: homeController.bannerList
                      );
                    } else {
                      return CarouselLoading();
                    }
                  }
                  ),
                  SectionTitle(title: 'Popular Category'),
                  Obx(() {
                    if (homeController.popularCategoryList.isNotEmpty)
                    {
                      return PopularCategory(
                          categories: homeController.popularCategoryList
                      );
                    } else {
                      return  PopularCategoryLoading();
                    }
                  }
                  ),
                  SectionTitle(title: 'Popular Product'),
                  Obx(() {
                    if (homeController.popularProductList.isNotEmpty)
                    {
                      return PopularProduct(
                          popularProducts: homeController.popularProductList);
                    } else {
                      return  PopularProductLoading();
                    }
                  }
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
