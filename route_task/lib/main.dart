import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/data/repo/data_source_imp.dart/productsDataSourceImp.dart';
import 'package:route_task/data/repo/repos/products_repo_imp.dart';

import 'package:route_task/data/repo/data_source_contract.dart/prodcutsDataSource.dart';

import 'package:route_task/core/api_manage.dart';
import 'package:route_task/domain/usecase/get_products_usecase.dart';
import 'package:route_task/ui/cubit/get_products_cubit.dart';
import 'package:route_task/ui/widgets/test.dart';

void main() {
  final apiManager = ApiManager.getInstance();
  final productDataSource = Productsdatasourceimp(apiManager: apiManager);
  final productsRepoImp = ProductsRepoImp(productdataSource: productDataSource);
  final getProductsUsecase =
      GetProductsUsecase(prodcutRepoContract: productsRepoImp);

  runApp(MyApp(getProductsUsecase: getProductsUsecase));
}

class MyApp extends StatelessWidget {
  final GetProductsUsecase getProductsUsecase;

  MyApp({required this.getProductsUsecase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            ProductCubit(getProductsUsecase: getProductsUsecase),
        child: ProductPage(),
      ),
    );
  }
}
