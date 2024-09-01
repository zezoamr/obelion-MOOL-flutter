class SectionItem {
  final String title;
  final String price;
  final String imageAsset;
  final int? discountPercentage;
  final String? originalPrice;

  SectionItem({
    required this.title,
    required this.price,
    required this.imageAsset,
    this.discountPercentage,
    this.originalPrice,
  });
}
