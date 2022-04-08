import 'package:flutter/material.dart';
import 'package:shopx_ecommerce_dribble_design/constants.dart';
import 'package:shopx_ecommerce_dribble_design/dummy_data.dart';
import 'package:shopx_ecommerce_dribble_design/widgets/round_icon_button.dart';
import 'package:shopx_ecommerce_dribble_design/widgets/rounded_button.dart';

import 'home_screen.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBackGround,
      body: SafeArea(child: DetailPage()),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState() {
    _product = _dummyData.getProductsWithId(1)[1];
    _imagePath = _product?.ImagesPathList[0] ?? "";
  }

  Product? _product;
  String _imagePath = "";
  DummyData _dummyData = new DummyData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                "Detail Product",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xCD222222)),
              ),
              Icon(
                Icons.favorite,
                color: kPinkyRed,
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(_imagePath), fit: BoxFit.contain),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        _product?.ProductName ?? "",
                        style: kProductHeader,
                      ),
                    ),
                    Expanded(
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                        elevation: 3,
                        label: Text(
                          '\$${_product?.Price.toString()}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 19,
                          ),
                        ),
                        backgroundColor: kSecondaryColor,
                      ),
                    )
                  ],
                ),
                Text(
                  _product?.Description ?? "",
                  style: kLightGrayText,
                ),
                Container(
                  height: 70,
                  child: ListView.separated(
                    shrinkWrap: true,
                    // padding: const EdgeInsets.all(8),
                    itemCount: _product?.ImagesPathList.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _imagePath = _product?.ImagesPathList[index] ?? "";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: kLightBackGround,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  _product?.ImagesPathList[index] ?? ""),
                              fit: BoxFit.contain,
                            )),
                          ),
                        ),
                      );
                    },

                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      width: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        BottomArea(),
      ],
    );
  }
}

class BottomArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(-4, 0), // Shadow position
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: kLightBackGround,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundIconButton(icon: Icons.remove, onPressed: () {}),
                  Text("0"),
                  RoundIconButton(icon: Icons.add, onPressed: () {})
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          Expanded(
            flex: 4,
            child: RoundedButton(
                color: Colors.black,
                textColor: Colors.white,
                text: "Add to Cart"),
          ),
        ],
      ),
    );
  }
}
