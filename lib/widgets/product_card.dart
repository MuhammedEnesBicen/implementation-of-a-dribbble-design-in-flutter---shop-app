import 'package:flutter/material.dart';
import 'package:shopx_ecommerce_dribble_design/constants.dart';

class ProductCard extends StatelessWidget {
  final String ThubmnailPath;
  final double Price;
  final String ProductName;

  ProductCard(
      {required this.ThubmnailPath,
      required this.Price,
      required this.ProductName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(ThubmnailPath),
                  fit: BoxFit.contain,
                )),
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: Chip(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9)),
                elevation: 3,
                label: Text(
                  '\$${Price.toString()}',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                backgroundColor: kSecondaryColor,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                ProductName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Icon(Icons.favorite_border_outlined)
          ],
        )
      ],
    );
  }
}
