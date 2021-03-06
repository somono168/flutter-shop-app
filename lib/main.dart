import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';

import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We need to use MultiProvider with
    // one screen that has many providers,
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          // ignore: deprecated_member_use
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrdersScreen.routeName: (ctx) => const OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
