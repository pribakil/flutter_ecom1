class ProductModel {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  ProductModel({
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.oldPrice,
    this.isFavorite = false,
  });
}


