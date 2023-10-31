import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rx_dart/blocs/products/products_bloc.dart';
import 'package:rx_dart/constants/layout/sizes.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) => SearchBar(
              leading: const Icon(Icons.search, color: Colors.grey, size: 16),
              hintText: 'Search',
              onChanged: (String input) =>
                  context.read<ProductsBloc>().add(SearchProduct(input)),
              constraints: BoxConstraints(
                  maxHeight: searchBarSize.height,
                  maxWidth: searchBarSize.width)));
}
