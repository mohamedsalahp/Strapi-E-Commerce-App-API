import 'package:badges/badges.dart';
import 'package:ecommerceapp/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
          )
        ]
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children:
        [
          Expanded(
              child:  Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(24)
                  ),
                  boxShadow: <BoxShadow>
                  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: Offset(0,0),
                      blurRadius: 8,
                    )
                  ]
                ),
                child: Obx(() => TextField(
                  autofocus: false,
                  controller: productController.searchTextEditController,
                  onSubmitted: (val)
                  {
                    productController.getProductByName(keyword: val);
                    dashboardController.updateIndex(1);
                  },
                  onChanged: (val)
                  {
                    productController.searchVal.value = val;
                  },
                  decoration: InputDecoration(
                    suffixIcon: productController.searchVal.value.isNotEmpty?
                        IconButton(
                            onPressed: () 
                            {
                              FocusScope.of(context).requestFocus(FocusNode());
                              productController.searchTextEditController.clear();
                              productController.searchVal.value = '';
                              productController.getProducts();
                            },
                            icon: Icon(Icons.clear)
                        ): null,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none
                      ),
                      hintText:  'Search...',
                      prefixIcon: Icon(Icons.search)
                  ),
                ),
                ),
              ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>
              [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  blurRadius: 8
                )
              ]
            ),
            padding: EdgeInsets.all(12),
            child: Icon(Icons.filter_alt_outlined,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Badge(
            badgeContent: Text(
              '2',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            badgeColor: Theme.of(context).primaryColor,
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>
                  [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8
                    )
                  ]
              ),
              padding: EdgeInsets.all(12),
              child: Icon(Icons.shopping_cart_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

