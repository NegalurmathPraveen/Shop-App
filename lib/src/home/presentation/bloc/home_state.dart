part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductListLoadedState extends HomeState {}

final class ProductListEmptyState extends HomeState {}

final class ProductListLoadingState extends HomeState {}

final class ProductListFailedState extends HomeState {
  final String message;
  ProductListFailedState(this.message);
}