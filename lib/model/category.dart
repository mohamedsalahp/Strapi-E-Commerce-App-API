import 'dart:convert';

List<Category>  popularCategoryListFromJson(String val) =>
    List<Category>.from(json.decode(val)['data']
        .map((category) => Category.popularCategoryFromJson(category))
    );

List<Category> categoryListFromJson(String val) =>
    List<Category>.from(json.decode(val)['data']
        .map((category) => Category.categoryFromJson(category))
    );

class Category
{
  late final int id;
  late final String name;
  late final String image;

  Category(
      {
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.popularCategoryFromJson(Map<String, dynamic> data) =>
      Category(
        id: data['id'],
        name: data['attributes']['category']['data']['attributes']['name'],
        image: data['attributes']['category']['data']['attributes']['image']
            ['data']['attributes']['url'],
      );


  factory Category.categoryFromJson(Map<String, dynamic> data) =>
      Category(
        id: data['id'],
        name: data['attributes']['name'],
        image: data['attributes']['image']['data']['attributes']['url'],
      );
}
