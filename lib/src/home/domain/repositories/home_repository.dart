import 'package:dartz/dartz.dart';

import '../../../../core/models/error_model.dart';
import '../../data/models/product_model.dart';


abstract class HomeRepository {
  Future<Either<Failure, List<ProductModel>>> getProductList();
}