import 'package:dartz/dartz.dart';
import 'package:route_task/core/failures.dart';
import 'package:route_task/data/repo/data_source_contract.dart/prodcutsDataSource.dart';
import 'package:route_task/domain/entity/product.dart';
import 'package:route_task/domain/repo/repos/products_repo.dart';

class ProductsRepoImp extends ProdcutRepoContract {
  final prodcutsDataSource productdataSource;

  ProductsRepoImp({required this.productdataSource});

  @override
  Future<Either<Failure, List<ProductResponseEntity>>> getProducts() {
    return productdataSource.getProducts();
  }
}
