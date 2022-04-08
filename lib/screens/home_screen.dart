import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopx_ecommerce_dribble_design/constants.dart';
import 'package:shopx_ecommerce_dribble_design/dummy_data.dart';
import 'package:shopx_ecommerce_dribble_design/screens/product_detail.dart';
import 'package:shopx_ecommerce_dribble_design/widgets/category_card.dart';
import 'package:shopx_ecommerce_dribble_design/widgets/custom_text_field.dart';
import 'package:shopx_ecommerce_dribble_design/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() {
    _categories = _dummyData.getCategories();
    _products = _dummyData.getProductsWithId(1);
  }
  DummyData _dummyData = new DummyData();
  List<Category> _categories = [];
  List<Product> _products = [];

  final int _selectedCategoryId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
            child: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      color: Colors.black,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.grid_view_outlined,
                      color: Colors.grey,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.grey,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    label: '')
              ],
            ),
          )),
      backgroundColor: kLightBackGround,
      body: SafeArea(
          child: HomePage(categories: _categories, products: _products)),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    required List<Category> categories,
    required List<Product> products,
  })  : _categories = categories,
        _products = products;

  final List<Category> _categories;
  final List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        CustomTextField(),
        SizedBox(
          height: 20,
        ),
        CartTotalCard(),
        SizedBox(
          height: 20,
        ),
        CategoryList(categories: _categories),
        SizedBox(
          height: 20,
        ),
        //container with fixed height removed here, after this scrool operation was been a little broke
        ProductsGridWidget(products: _products),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            image: DecorationImage(
                image: AssetImage('assets/images/promotion.png'),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
    required List<Category> categories,
  })  : _categories = categories,
        super(key: key);

  final List<Category> _categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        // padding: const EdgeInsets.all(8),
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
              icon: _categories[index].icon,
              label: _categories[index].label,
              color: _categories[index].color);
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
      ),
    );
  }
}

class ProductsGridWidget extends StatelessWidget {
  const ProductsGridWidget({
    Key? key,
    required List<Product> products,
  })  : _products = products,
        super(key: key);

  final List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeLeft: true,
      removeBottom: true,
      removeRight: true,
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.8,
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: _products.length,
          itemBuilder: (BuildContext ctx, index) {
            int thumbIndex = _products[index].ThumnailIndex;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProductDetail()));
              },
              child: ProductCard(
                  ThubmnailPath: _products[index].ImagesPathList[thumbIndex],
                  Price: _products[index].Price,
                  ProductName: _products[index].ProductName),
            );
          }),
    );
  }
}

class CartTotalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kDarkBackGround, borderRadius: BorderRadius.circular(14)),
      height: 120,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Balance',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              Text(
                'VISA',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$280.65',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Text(
                '...3028',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
