import 'package:ecommerceapp/view/home/components/popular_category/popular_category_loading_card.dart';
import 'package:flutter/material.dart';

class PopularCategoryLoading extends StatelessWidget {
  const PopularCategoryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics:   BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) =>  PopularCategoryLoadingCard()
      ),
    );
  }
}
