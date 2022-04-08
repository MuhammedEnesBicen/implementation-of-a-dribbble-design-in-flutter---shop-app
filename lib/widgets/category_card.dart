import 'package:flutter/material.dart';
import 'package:shopx_ecommerce_dribble_design/constants.dart';

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  CategoryCard({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: (color != null) ? color : Colors.white,
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      width: 90,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 35,
            color: (color != null) ? Colors.white : Colors.black,
          ),
          Text(
            label,
            style: (color != null)
                ? kLightGrayText.copyWith(color: Colors.white, fontSize: 12)
                : kLightGrayText.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
