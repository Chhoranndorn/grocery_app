class ProductResponse {
  final bool status;
  final List<Product> products;
  final Meta meta;

  ProductResponse({
    required this.status,
    required this.products,
    required this.meta,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'] ?? false,
      products: (json['data'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}
class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final String brand;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.brand,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      price: double.parse(json['price'].toString()),
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
class Meta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  Meta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
      total: json['total'],
    );
  }
}