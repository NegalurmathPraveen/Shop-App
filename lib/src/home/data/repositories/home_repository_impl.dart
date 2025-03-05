import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/error_model.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/product_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _dataSource;

  HomeRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<ProductModel>>> getProductList() async {
    try {
      final response = await _dataSource.getProductList();
      return Right(response);
    } on DioException catch (error, stackTrace) {
      return Left(Failure(statusCode: error.response?.statusCode ?? 401, message: error.message ?? "unauthorized"));
    }
  }
}
