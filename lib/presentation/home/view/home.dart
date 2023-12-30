import 'package:flutter/material.dart';
import 'package:rx_dart/presentation/widgets/products/product_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/';
  static const name = 'home';

  @override
  Widget build(BuildContext context) => const ProductListWidget();
}
