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
      products: (json['data'] as List<dynamic>? ?? [])
          .map((e) => Product.fromJson(e))
          .toList(),
      meta: Meta.fromJson(json['meta'] ?? {}),
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
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: _parseDouble(json['price']),
      category: json['category']?.toString() ?? '',
      brand: json['brand']?.toString() ?? '',
      image: json['image'] ?? '',
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    return double.tryParse(value.toString()) ?? 0.0;
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
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
      perPage: json['per_page'] ?? 10,
      total: json['total'] ?? 0,
    );
  }
}
