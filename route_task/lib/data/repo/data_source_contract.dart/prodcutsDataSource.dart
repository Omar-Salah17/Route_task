import 'package:dartz/dartz.dart';
import 'package:route_task/core/failures.dart';
import 'package:route_task/domain/entity/product.dart';

abstract class prodcutsDataSource {
  Future<Either<Failure, List<ProductResponseEntity>>> getProducts();
}
