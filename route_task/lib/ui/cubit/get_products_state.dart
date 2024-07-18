import 'package:route_task/domain/entity/product.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductResponseEntity> products;

  const ProductLoaded({required this.products});
}

class ProductError extends ProductState {
  final String message;

  const ProductError({required this.message});
}
