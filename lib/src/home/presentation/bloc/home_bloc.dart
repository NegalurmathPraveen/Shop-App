import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/product_model.dart';
import '../../domain/usecases/usecases.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases _useCases;

  List<ProductModel> get productList => _productList;

  List<ProductModel> get favouriteList => _favouriteList;

  final List<ProductModel> _productList = [];
  final List<ProductModel> _favouriteList = [];
  final List<ProductModel> _originalList = [];

  HomeBloc(this._useCases) : super(HomeInitial()) {
    on<GetProductListEvent>(_getProductEventHandler);
    on<MarkAsFavouriteEvent>(_markAsFavouriteEventHandler);
    on<SearchProductListEvent>(_searchProductListEventHandler);
  }

  FutureOr<void> _getProductEventHandler(GetProductListEvent event, emit) async {
    emit(ProductListLoadingState());
    final result = await _useCases.getProductList();
    result.fold((l) => emit(ProductListFailedState(l.message)), (r) {
      _productList.clear();
      _originalList.clear();
      _originalList.addAll(r);
      _productList.addAll(r);
      return emit(ProductListLoadedState());
    });
  }

  FutureOr<void> _markAsFavouriteEventHandler(MarkAsFavouriteEvent event, emit) {
    if (event.favouritiseItem) {
      _favouriteList.add(event.model);
    } else if (_favouriteList.contains(event.model)) {
      _favouriteList.remove(event.model);
    }
    emit(ProductListLoadedState());
  }

  FutureOr<void> _searchProductListEventHandler(SearchProductListEvent event, emit) async {
    emit(ProductListLoadingState());
    if (event.searchText == "") {
      _productList.clear();
      _productList.addAll(_originalList);
    } else {
      final updateList = _productList.where((element) => element.title.toUpperCase().contains(event.searchText.toUpperCase())).toList();
      _productList.clear();
      _productList.addAll(updateList);
    }
    Future.delayed(const Duration(seconds: 2));
    emit(ProductListLoadedState());
  }
}
