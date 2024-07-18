import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:route_task/domain/entity/product.dart';

import 'package:route_task/domain/usecase/get_products_usecase.dart';
import 'package:route_task/core/failures.dart';
import 'package:route_task/ui/cubit/get_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUsecase getProductsUsecase;

  ProductCubit({required this.getProductsUsecase}) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    Either<Failure, List<ProductResponseEntity>> result =
        await getProductsUsecase.invoke();

    result.fold(
      (failure) => emit(ProductError(message: failure.errorMessage)),
      (products) => emit(ProductLoaded(products: products)),
    );
  }
}
