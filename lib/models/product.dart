class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.oldPrice,
    this.isFavorite = false,
  });
}

final List<Product> products = [
  Product(
    name: 'Shoes',
    category: 'Footwear',
    price: 69.0,
    oldPrice: 138.0,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is the description of product 1',
  ),
  Product(
    name: 'Laptop',
    category: 'Electronics',
    price: 699.0,
    isFavorite: true,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'This is A very very long description for product 2',
  ),
  Product(
    name: 'Jordan Shoes',
    category: 'Footwear',
    price: 50.0,
    isFavorite: true,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'This is the description of product 3',
  ),
  Product(
    name: 'Puma Shoes',
    category: 'Footwear',
    price: 50.0,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'This is the description of product 4',
  ),
];
