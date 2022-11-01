import 'package:ecommerceapp/controller/controllers.dart';
import 'package:ecommerceapp/view/category/compoents/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (categoryController.categoryList.isNotEmpty)
      {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: categoryController.categoryList.length,
            itemBuilder: (context, index) =>
                CategoryCard(category: categoryController.categoryList[index]),
        );
      } else {
        return Container();
      }
    });
  }
}
