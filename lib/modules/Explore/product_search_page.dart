import 'package:flutter/material.dart';
import 'package:grocery_app/modules/Explore/category_detail_page.dart';

class ProductSearchPage extends StatefulWidget {
  final List<CategoryProduct> products;
  final String initialQuery;

  const ProductSearchPage({
    super.key,
    required this.products,
    this.initialQuery = '',
  });

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  late final TextEditingController _searchController = TextEditingController(
    text: widget.initialQuery,
  );

  ProductFilterSelection _filterSelection = const ProductFilterSelection();

  List<CategoryProduct> get _filteredProducts {
    final query = _searchController.text.trim().toLowerCase();

    return widget.products.where((product) {
      final matchesQuery =
          query.isEmpty ||
          product.name.toLowerCase().contains(query) ||
          product.category.toLowerCase().contains(query);
      final matchesCategory =
          _filterSelection.categories.isEmpty ||
          _filterSelection.categories.contains(product.category);
      final matchesBrand =
          _filterSelection.brands.isEmpty ||
          _filterSelection.brands.contains(product.brand);

      return matchesQuery && matchesCategory && matchesBrand;
    }).toList();
  }

  Future<void> _openFilters() async {
    final selection = await Navigator.push<ProductFilterSelection>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProductFilterPage(initialSelection: _filterSelection),
      ),
    );

    if (selection != null) {
      setState(() {
        _filterSelection = selection;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 26),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        onChanged: (_) => setState(() {}),
                        textInputAction: TextInputAction.search,
                        style: const TextStyle(
                          color: Color(0xFF181725),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xFF181725),
                            size: 32,
                          ),
                          suffixIcon: _searchController.text.isEmpty
                              ? null
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _searchController.clear();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Color(0xFFB3B3B3),
                                    size: 28,
                                  ),
                                ),
                          hintText: 'Search Store',
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
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: _openFilters,
                      icon: const Icon(
                        Icons.tune,
                        color: Color(0xFF181725),
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (products.isEmpty)
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
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryProductCard(product: products[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
