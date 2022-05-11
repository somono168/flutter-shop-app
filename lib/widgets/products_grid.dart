import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  const ProductsGrid({Key? key, required this.showFavs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this config let us listening to communication channel of
    // provider instance of Products.
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,

      // item builder define how every grid item is built
      // how every grid cell should be built
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),

      // grid delegate allow us to define how grid generally
      // should be structured, so how many column should have
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // amount of Column
        childAspectRatio: 3 / 2, // Heigh = 3, width = 2
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
