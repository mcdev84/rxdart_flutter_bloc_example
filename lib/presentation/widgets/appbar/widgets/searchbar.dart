import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/products/products_bloc.dart';
import 'package:rx_dart/constants/layout/sizes.dart';
import 'package:rx_dart/constants/layout/styles.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) => SearchBar(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.resolveWith(
                  (states) => searchBarRoundedBorder3),
              leading: const Icon(Icons.search, color: Colors.grey, size: 16),
              hintText: 'Search',
              onChanged: (String input) =>
                  context.read<ProductsBloc>().add(SearchProduct(input)),
              constraints: BoxConstraints(
                  minHeight: searchBarSize.height,
                  maxHeight: searchBarSize.height,
                  minWidth: searchBarSize.width,
                  maxWidth: searchBarSize.width)));

  @override
  Size get preferredSize => appBarSize;
}
