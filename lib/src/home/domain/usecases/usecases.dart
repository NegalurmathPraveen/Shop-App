import 'package:dartz/dartz.dart';

import '../../../../core/models/error_model.dart';
import '../../data/models/product_model.dart';
import '../repositories/home_repository.dart';

class HomeUseCases {
  final HomeRepository _demoRepo;

  const HomeUseCases(this._demoRepo);

  Future<Either<Failure, List<ProductModel>>> getProductList() async => _demoRepo.getProductList();
}
