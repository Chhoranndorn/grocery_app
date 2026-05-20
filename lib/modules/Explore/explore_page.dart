import 'package:flutter/material.dart';
import 'package:grocery_app/modules/Explore/category_detail_page.dart';
import 'package:grocery_app/modules/Explore/product_search_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();

  final List<_ExploreCategory> _categories = const [
    _ExploreCategory(
      title: 'Fresh Fruits\n& Vegetable',
      image:
          'https://www.pngarts.com/files/3/Fruits-And-Vegetables-Basket-PNG-High-Quality-Image.png',
      backgroundColor: Color(0xFFEFF8F2),
      borderColor: Color(0xFF53B175),
      products: [
        CategoryProduct(
          name: 'Organic Bananas',
          detail: '12kg, Price',
          price: 3.00,
          category: 'Fresh Fruits & Vegetable',
          image:
              'https://www.pngarts.com/files/1/Banana-PNG-Transparent-Image.png',
        ),
        CategoryProduct(
          name: 'Bell Pepper Red',
          detail: '1kg, Price',
          price: 4.99,
          category: 'Fresh Fruits & Vegetable',
          image:
              'https://www.pngarts.com/files/5/Red-Bell-Pepper-PNG-Image-Background.png',
        ),
        CategoryProduct(
          name: 'Ginger',
          detail: '250gm, Price',
          price: 2.99,
          category: 'Fresh Fruits & Vegetable',
          image: 'https://www.pngarts.com/files/8/Ginger-PNG-Free-Download.png',
        ),
        CategoryProduct(
          name: 'Fresh Tomatoes',
          detail: '1kg, Price',
          price: 2.49,
          category: 'Fresh Fruits & Vegetable',
          image: 'https://www.pngarts.com/files/4/Tomato-PNG-Free-Download.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Cooking Oil\n& Ghee',
      image:
          'https://www.pngarts.com/files/8/Olive-Oil-Bottle-PNG-Image-Transparent.png',
      backgroundColor: Color(0xFFFFF4EA),
      borderColor: Color(0xFFF8A44C),
      products: [
        CategoryProduct(
          name: 'Olive Oil',
          detail: '1L, Price',
          price: 8.99,
          category: 'Cooking Oil & Ghee',
          image:
              'https://www.pngarts.com/files/8/Olive-Oil-Bottle-PNG-Image-Transparent.png',
        ),
        CategoryProduct(
          name: 'Sunflower Oil',
          detail: '2L, Price',
          price: 7.50,
          category: 'Cooking Oil & Ghee',
          image:
              'https://www.pngarts.com/files/7/Cooking-Oil-PNG-Free-Download.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Meat & Fish',
      image: 'https://www.pngarts.com/files/4/Meat-PNG-Free-Download.png',
      backgroundColor: Color(0xFFFFEFEA),
      borderColor: Color(0xFFF7A593),
      products: [
        CategoryProduct(
          name: 'Beef Bone',
          detail: '1kg, Price',
          price: 7.99,
          category: 'Meat & Fish',
          image: 'https://www.pngarts.com/files/4/Meat-PNG-Free-Download.png',
        ),
        CategoryProduct(
          name: 'Fresh Salmon',
          detail: '1kg, Price',
          price: 12.99,
          category: 'Meat & Fish',
          image: 'https://www.pngarts.com/files/4/Salmon-PNG-Image.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Bakery & Snacks',
      image: 'https://www.pngarts.com/files/4/Bread-PNG-High-Quality-Image.png',
      backgroundColor: Color(0xFFF8F0FA),
      borderColor: Color(0xFFD3A9E3),
      products: [
        CategoryProduct(
          name: 'Fresh Bread',
          detail: '1pc, Price',
          price: 2.50,
          category: 'Bakery & Snacks',
          image:
              'https://www.pngarts.com/files/4/Bread-PNG-High-Quality-Image.png',
        ),
        CategoryProduct(
          name: 'Chocolate Cookies',
          detail: '200g, Price',
          price: 3.25,
          category: 'Bakery & Snacks',
          image: 'https://www.pngarts.com/files/4/Cookies-PNG-Pic.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Dairy & Eggs',
      image:
          'https://www.pngarts.com/files/3/Dairy-Products-PNG-Free-Download.png',
      backgroundColor: Color(0xFFFFF8E5),
      borderColor: Color(0xFFFDE07F),
      products: [
        CategoryProduct(
          name: 'Egg Chicken Red',
          detail: '4pcs, Price',
          price: 1.99,
          category: 'Eggs',
          brand: 'Kazi Farmas',
          image:
              'https://www.pngarts.com/files/4/Egg-Basket-PNG-High-Quality-Image.png',
        ),
        CategoryProduct(
          name: 'Fresh Milk',
          detail: '1L, Price',
          price: 2.49,
          category: 'Dairy & Eggs',
          image: 'https://www.pngarts.com/files/4/Milk-PNG-Picture.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Beverages',
      image:
          'https://www.pngarts.com/files/7/Soft-Drink-Beverage-PNG-Free-Download.png',
      backgroundColor: Color(0xFFEDF8FE),
      borderColor: Color(0xFFB7E1F7),
      products: [
        CategoryProduct(
          name: 'Diet Coke',
          detail: '355ml, Price',
          price: 1.99,
          category: 'Beverages',
          image:
              'https://www.pngarts.com/files/3/Diet-Coke-Can-PNG-High-Quality-Image.png',
        ),
        CategoryProduct(
          name: 'Sprite Can',
          detail: '325ml, Price',
          price: 1.50,
          category: 'Beverages',
          image:
              'https://www.pngarts.com/files/3/Sprite-Can-PNG-High-Quality-Image.png',
        ),
        CategoryProduct(
          name: 'Apple & Grape Juice',
          detail: '2L, Price',
          price: 15.99,
          category: 'Beverages',
          image:
              'https://www.pngarts.com/files/6/Fruit-Juice-Bottle-PNG-Image.png',
        ),
        CategoryProduct(
          name: 'Orange Juice',
          detail: '2L, Price',
          price: 15.99,
          category: 'Beverages',
          image:
              'https://www.pngarts.com/files/6/Orange-Juice-PNG-Transparent-Image.png',
        ),
        CategoryProduct(
          name: 'Coca Cola Can',
          detail: '325ml, Price',
          price: 4.99,
          category: 'Beverages',
          image: 'https://www.pngarts.com/files/3/Coca-Cola-Can-PNG-Pic.png',
        ),
        CategoryProduct(
          name: 'Pepsi Can',
          detail: '330ml, Price',
          price: 4.99,
          category: 'Beverages',
          image:
              'https://www.pngarts.com/files/3/Pepsi-Can-PNG-High-Quality-Image.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Frozen Foods',
      image: 'https://www.pngarts.com/files/7/Frozen-Food-PNG-Photo.png',
      backgroundColor: Color(0xFFF4F0FF),
      borderColor: Color(0xFFCDBDFF),
      products: [
        CategoryProduct(
          name: 'Frozen Pizza',
          detail: '1pc, Price',
          price: 6.99,
          category: 'Frozen Foods',
          image: 'https://www.pngarts.com/files/7/Frozen-Food-PNG-Photo.png',
        ),
      ],
    ),
    _ExploreCategory(
      title: 'Personal Care',
      image:
          'https://www.pngarts.com/files/8/Beauty-Products-PNG-Transparent-Image.png',
      backgroundColor: Color(0xFFFFF0F6),
      borderColor: Color(0xFFF3A5C5),
      products: [
        CategoryProduct(
          name: 'Body Wash',
          detail: '500ml, Price',
          price: 5.99,
          category: 'Personal Care',
          image:
              'https://www.pngarts.com/files/8/Beauty-Products-PNG-Transparent-Image.png',
        ),
      ],
    ),
  ];

  List<_ExploreCategory> get _filteredCategories {
    final query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return _categories;
    }

    return _categories
        .where((category) => category.title.toLowerCase().contains(query))
        .toList();
  }

  List<CategoryProduct> get _allProducts {
    return [
      for (final category in _categories) ...category.products,
      const CategoryProduct(
        name: 'Egg Chicken White',
        detail: '180g, Price',
        price: 1.50,
        category: 'Eggs',
        brand: 'Kazi Farmas',
        image: 'https://www.pngarts.com/files/4/Egg-PNG-Free-Download.png',
      ),
      const CategoryProduct(
        name: 'Egg Pasta',
        detail: '30gm, Price',
        price: 15.99,
        category: 'Noodles & Pasta',
        brand: 'Ifad',
        image: 'https://www.pngarts.com/files/7/Pasta-PNG-Download-Image.png',
      ),
      const CategoryProduct(
        name: 'Egg Noodles',
        detail: '2L, Price',
        price: 15.99,
        category: 'Noodles & Pasta',
        brand: 'Cocola',
        image:
            'https://www.pngarts.com/files/7/Instant-Noodles-PNG-Free-Download.png',
      ),
      const CategoryProduct(
        name: 'Mayonnais Eggless',
        detail: '325ml, Price',
        price: 4.99,
        category: 'Fast Food',
        brand: 'Individual Callection',
        image: 'https://www.pngarts.com/files/7/Mayonnaise-PNG-Picture.png',
      ),
      const CategoryProduct(
        name: 'Egg Noodles',
        detail: '180g, Price',
        price: 4.99,
        category: 'Noodles & Pasta',
        brand: 'Cocola',
        image:
            'https://www.pngarts.com/files/7/Noodles-PNG-Transparent-Image.png',
      ),
    ];
  }

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProductSearchPage(products: _allProducts, initialQuery: 'Egg'),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = _filteredCategories;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Text(
                      'Find Products',
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 36),
                    TextField(
                      controller: _searchController,
                      readOnly: true,
                      onTap: _openSearch,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                        hintStyle: const TextStyle(
                          color: Color(0xFF7C7C7C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFF181725),
                          size: 30,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF2F3F2),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 22,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                  ],
                ),
              ),
            ),
            if (categories.isEmpty)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    'No products found',
                    style: TextStyle(
                      color: Color(0xFF7C7C7C),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                sliver: SliverGrid.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.92,
                  ),
                  itemBuilder: (context, index) {
                    return _ExploreCategoryCard(category: categories[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ExploreCategoryCard extends StatelessWidget {
  final _ExploreCategory category;

  const _ExploreCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: category.backgroundColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailPage(
                title: category.displayTitle,
                products: category.products,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: category.borderColor, width: 1.2),
          ),
          padding: const EdgeInsets.fromLTRB(14, 20, 14, 18),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  category.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.shopping_basket_outlined,
                      color: category.borderColor,
                      size: 64,
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Center(
                      child: CircularProgressIndicator(
                        color: category.borderColor,
                        strokeWidth: 2,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                category.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF181725),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExploreCategory {
  final String title;
  final String image;
  final Color backgroundColor;
  final Color borderColor;
  final List<CategoryProduct>? _products;

  String get displayTitle => title.replaceAll('\n', ' ');
  List<CategoryProduct> get products => _products ?? const [];

  const _ExploreCategory({
    required this.title,
    required this.image,
    required this.backgroundColor,
    required this.borderColor,
    required List<CategoryProduct> products,
  }) : _products = products;
}
