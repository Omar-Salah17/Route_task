import 'package:dartz/dartz.dart';
import 'package:route_task/core/api_manage.dart';
import 'package:route_task/core/failures.dart';
import 'package:route_task/data/repo/data_source_contract.dart/prodcutsDataSource.dart';
import 'package:route_task/domain/entity/product.dart';
import 'package:route_task/domain/repo/repos/products_repo.dart';

class Productsdatasourceimp implements prodcutsDataSource {
  final ApiManager apiManager;

  Productsdatasourceimp({required this.apiManager});

  @override
  Future<Either<Failure, List<ProductResponseEntity>>> getProducts() async {
    var result = await apiManager.getProducts();
    return result.fold(
      (failure) => left(failure),
      (response) => right(response),
    );
  }
}
