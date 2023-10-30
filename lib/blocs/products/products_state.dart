part of 'products_bloc.dart';

enum ProductsStatus {  loading, loaded, error }

@immutable
final class ProductsState extends Equatable {
  final Map<String, dynamic> error;
  final ProductsStatus status;

  const ProductsState(
      {this.status = ProductsStatus.loading,
      this.error = const <String, dynamic>{}});

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductEntity>? products,
    Map<String, dynamic>? error,
  }) =>
      ProductsState(
        status: status ?? this.status,
        error: error ?? this.error,
      );

  @override
  List<Object?> get props => [status, error];
}
