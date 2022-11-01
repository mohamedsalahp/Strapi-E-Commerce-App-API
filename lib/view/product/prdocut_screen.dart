import 'package:ecommerceapp/component/main_header.dart';
import 'package:ecommerceapp/controller/controllers.dart';
import 'package:ecommerceapp/view/product/components/product_grid.dart';
import 'package:ecommerceapp/view/product/components/product_loading_grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
           MainHeader(),
          Expanded(
              child: Obx((){
                if(productController.isProductLoading.value){
                  return const ProductLoadingGrid();
                } else {
                  if(productController.productList.isNotEmpty){
                    return ProductGrid(products: productController.productList);
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                      [
                        Image.asset('assets/product_not_found.png'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Products Not Found ! '
                            '(كسمك اكتب صح يا علق) '),
                      ],
                    );
                  }
                }
              })
          )
        ],
      ),
    );
  }
}
