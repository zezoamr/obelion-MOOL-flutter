import 'package:flutter/material.dart';
import 'package:flutter_mool/data/SectionItem.dart';

Widget buildNewCardItem(SectionItem item) {
  return Container(
    width: 220,
    margin: EdgeInsets.symmetric(horizontal: 7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ),
              if (item.discountPercentage != null)
                Positioned(
                  top: 8,
                  left: 0,
                  child: Container(
                    width: 50,
                    padding: EdgeInsets.only(left: 10, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      '${item.discountPercentage}%',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(item.title, style: TextStyle(fontSize: 16)),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (item.originalPrice != null)
                    Text(
                      item.originalPrice!,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                      ),
                    ),
                  SizedBox(width: 5),
                  Text(item.price,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
