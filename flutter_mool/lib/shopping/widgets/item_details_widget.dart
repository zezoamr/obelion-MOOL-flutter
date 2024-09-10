import 'package:flutter/material.dart';

class ItemDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Elegant Blazer',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '2500 SAR',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ZARA', style: TextStyle(color: Colors.grey)),
              Text('VAT included', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star, color: Colors.amber, size: 18),
              Icon(Icons.star_half, color: Colors.amber, size: 18),
              SizedBox(width: 4),
              Text('(23)', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Return Policy', style: TextStyle(fontSize: 16)),
              Icon(Icons.chevron_right),
            ],
          ),
          SizedBox(height: 16),
          Text('Size',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              _buildSizeButton('XS', true),
              SizedBox(width: 8),
              _buildSizeButton('S', false),
              SizedBox(width: 8),
              _buildSizeButton('L', false),
              SizedBox(width: 8),
              _buildSizeButton('XL', false),
            ],
          ),
          SizedBox(height: 16),
          Text('Color',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            children: [
              _buildColorButton(Color(0xFFFAD7BD)),
              SizedBox(width: 8),
              _buildColorButton(Color(0xFF8B4513)),
              SizedBox(width: 8),
              _buildColorButton(Colors.black),
              SizedBox(width: 8),
              _buildColorButton(Colors.white),
            ],
          ),
          SizedBox(height: 16),
          Text('Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'ZARA elegant Two-Button Fitted Blazer for Women ZARA 2elegant2 Two-Button 2Fitted Blazer f2or Women',
            overflow: TextOverflow.fade,
          ),
          SizedBox(height: 16),
          Text('Product Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          _buildProductDetailsSection(),
        ],
      ),
    );
  }

  Widget _buildSizeButton(String label, bool isSelected) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.transparent,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
    );
  }

  Widget _buildProductDetailsSection() {
    final details = [
      ['Product Code', '458754485'],
      ['Brand', 'Zara'],
      ['Fabric', 'Cotton'],
      ['Model wearing size', 'S'],
      ['Shape', 'Tiered'],
    ];

    return Column(
      children: [
        for (int i = 0; i < details.length; i += 2)
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildProductDetailItem(details[i][0], details[i][1]),
                ),
                if (i + 1 < details.length) ...[
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildProductDetailItem(
                        details[i + 1][0], details[i + 1][1]),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildProductDetailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
