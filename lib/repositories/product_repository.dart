import 'package:ecom1_frontend/models/product_model.dart';

class ProductRepository {
  List<ProductModel> getProducts() {
    return [
      ProductModel(
        name: 'Shoes',
        category: 'Footwear',
        price: 69.0,
        oldPrice: 138.0,
        imageUrl: 'assets/images/shoe.jpg',
        description: 'This is the description of product 1',
      ),
      ProductModel(
        name: 'Laptop',
        category: 'Electronics',
        price: 699.0,
        isFavorite: true,
        imageUrl: 'assets/images/laptop.jpg',
        description: 'This is A very very long description for product 2',
      ),
      ProductModel(
        name: 'Jordan Shoes',
        category: 'Footwear',
        price: 50.0,
        isFavorite: true,
        imageUrl: 'assets/images/shoe2.jpg',
        description: 'This is the description of product 3',
      ),
      ProductModel(
        name: 'Puma Shoes',
        category: 'Footwear',
        price: 50.0,
        imageUrl: 'assets/images/shoes2.jpg',
        description: 'This is the description of product 4',
      ),
    ];
  }
}
