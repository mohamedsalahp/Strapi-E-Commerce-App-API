import 'dart:convert';
import 'package:ecommerceapp/model/tag.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((val) => Product.popularProductFromJson(val)));

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)['data'].map((val) => Product.productFromJson(val)));

class Product {
  late final int id;
  late final String name;
  late final String description;
  late final List<String> images;
  late final List<Tag> tags;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.tags,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['product']['data']['attributes']['name'],
      description: data['attributes']['product']['data']['attributes']
          ['description'],
      images: List<String>.from(data['attributes']['product']['data']
              ['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
    tags: [],

  );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
      id: data['id'],
      name: data['attributes']['name'],
      description: data['attributes']['description'],
      images: List<String>.from(data['attributes']['images']['data']
          .map((image) => image['attributes']['url'])),
      tags: List<Tag>.from(data['attributes']['tags']['data'].map((val) => Tag.fromJson(val))),
  );
}
