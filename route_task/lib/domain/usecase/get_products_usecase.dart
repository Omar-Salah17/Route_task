import 'package:dartz/dartz.dart';
import 'package:route_task/core/failures.dart';
import 'package:route_task/domain/entity/product.dart';
import 'package:route_task/domain/repo/repos/products_repo.dart';

class GetProductsUsecase {
  final ProdcutRepoContract prodcutRepoContract;

  GetProductsUsecase({required this.prodcutRepoContract});

  Future<Either<Failure, List<ProductResponseEntity>>> invoke() {
    return prodcutRepoContract.getProducts();
  }
}
