part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class ProductsFetched extends ProductsEvent {}

final class SearchProduct extends ProductsEvent {
  final String searchTerm;

  SearchProduct(this.searchTerm);

  @override
  List<Object> get props => [searchTerm];
}
