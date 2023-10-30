import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rx_dart/data/datasources/products/products_repository.dart';
import 'package:rx_dart/domain/entities/product/product_entity.dart';
import 'package:rxdart/rxdart.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;

  final BehaviorSubject<List<ProductEntity>> _productsSubject;

  ProductsBloc(
    this._productsRepository,
  )   : _productsSubject = BehaviorSubject<List<ProductEntity>>(),
        super(const ProductsState(status:ProductsStatus.loading )) {
    /// Before response
    state.copyWith(
      status: ProductsStatus.loading,
      error: {},
    );
    _productsRepository.getProducts().then((value) {
      _productsSubject.add(value);
      emit(state.copyWith(status: ProductsStatus.loaded, error: {}));
    });

    on<SearchProduct>((event, emit) async {
      await _productsRepository.searchProducts(event.searchTerm).then((value) {
        _productsSubject.add(value);
        emit(state.copyWith(status: ProductsStatus.loaded, error: {}));
      });
    });
  }

  BehaviorSubject<List<ProductEntity>> get productsSubject => _productsSubject;
}
