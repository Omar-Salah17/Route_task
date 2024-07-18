import 'package:route_task/core/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:route_task/domain/entity/product.dart';

abstract class ProdcutRepoContract {
  Future<Either<Failure, List<ProductResponseEntity>>> getProducts();
}
