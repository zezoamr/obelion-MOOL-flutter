import 'package:flutter/material.dart';
import 'package:flutter_mool/data/SectionItem.dart';
import 'package:flutter_mool/screens/productdetails_screen.dart';

Widget buildNewCardItem(SectionItem item, BuildContext context,
    {double givewidth = 220}) {
  return Container(
    width: givewidth,
    margin: EdgeInsets.symmetric(horizontal: 6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductdetailsScreen(),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    item.imageAsset,
                    fit: BoxFit.cover,
                  ),
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
                    icon: item.isFav
                        ? Icon(Icons.favorite, color: Colors.black, size: 20)
                        : Icon(Icons.favorite_border, size: 20),
                    onPressed: () {},
                    padding: EdgeInsets.all(4),
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
              if (item.discountPercentage != null)
                Positioned(
                  top: 8,
                  left: 0,
                  child: Container(
                    width: 50,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Text(
                      '${item.discountPercentage}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(item.title,
            style: TextStyle(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        SizedBox(height: 2),
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
                        fontSize: 10,
                      ),
                    ),
                  SizedBox(width: 4),
                  Text(item.price,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white, size: 16),
                onPressed: () {},
                padding: EdgeInsets.all(4),
                constraints: BoxConstraints(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
