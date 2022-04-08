import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final IconData icon;
  final String label;
  final Color? color;

  Category(
      {required this.categoryId,
      required this.icon,
      required this.label,
      this.color});
}

class Product {
  final int CategoryId;
  final int ThumnailIndex;
  final List<String> ImagesPathList;
  final String ProductName;
  final double Price;
  final String Description;

  Product(
      {required this.CategoryId,
      required this.ThumnailIndex,
      required this.ImagesPathList,
      required this.ProductName,
      required this.Price,
      required this.Description});
}

class DummyData {
  List<Category> _Categories = [
    Category(
      categoryId: 1,
      icon: Icons.account_balance_wallet_outlined,
      label: 'Best Deal',
      color: Color(0xFF89A9D1),
    ),
    Category(
      categoryId: 2,
      icon: Icons.watch_outlined,
      label: 'Life Style',
    ),
    Category(
      categoryId: 3,
      icon: Icons.weekend_outlined,
      label: 'Furniture',
    ),
    Category(
      categoryId: 4,
      icon: Icons.wine_bar_outlined,
      label: 'Kitchen',
    ),
    Category(
      categoryId: 5,
      icon: Icons.accessibility_new_outlined,
      label: 'Sport',
    )
  ];

  List<Category> getCategories() {
    return _Categories;
  }

  static List<String> _product1ImagesPaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
  ];
  static List<String> _product2ImagesPaths = [
    'assets/images/product1_img1.jpg',
    'assets/images/product1_img2.jpg',
    'assets/images/product1_img3.jpg',
    'assets/images/product1_img4.jpg',
    'assets/images/product1_img5.jpg',
  ];
  List<Product> _products = [
    Product(
        CategoryId: 1,
        ThumnailIndex: 3,
        ImagesPathList: _product1ImagesPaths,
        ProductName: "Nest Doorbell\n(battery)",
        Price: 42.50,
        Description:
            "Nest Cams are packed with helpful features, no matter which one you choose (Google Home app required). Only the alerts you want"),
    Product(
        CategoryId: 1,
        ThumnailIndex: 0,
        ImagesPathList: _product2ImagesPaths,
        ProductName: "Jordan Zoom Seperate PF - Basketball Shoes",
        Price: 18.50,
        Description:
            "Luka's step-back shot is the muse for the Nike Jordan Zoom Seperate PF, a lightweight low-top shoe that designed to help you take control on the court."),
  ];

  List<Product> getProductsWithId(int categoryId) {
    return _products
        .takeWhile((item) => (item.CategoryId == categoryId) ? true : false)
        .toList();
  }
}
