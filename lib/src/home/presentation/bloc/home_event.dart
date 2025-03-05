part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetProductListEvent extends HomeEvent{}

class SearchProductListEvent extends HomeEvent{
  final String searchText;
  SearchProductListEvent(this.searchText);
}

class MarkAsFavouriteEvent extends HomeEvent{
  final ProductModel model;
  final bool favouritiseItem;
  MarkAsFavouriteEvent({required this.model,required this.favouritiseItem});
}