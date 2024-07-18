import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:route_task/core/api_constants.dart';
import 'package:route_task/core/failures.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:route_task/data/model/product_response_dto.dart';
import 'dart:developer';

import 'package:route_task/domain/entity/product.dart';

class ApiManager {
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failure, List<ProductResponseEntity>>> getProducts() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productsApi);
    final connectivityResult = await (Connectivity().checkConnectivity());

    log('Connectivity Result: $connectivityResult');
    log("here");

    try {
      log("ana gwa el try");
      var response = await http.get(url);
      log('HTTP Response Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<dynamic> productResponseJson = jsonResponse['products'];
        List<ProductResponseDto> productResponseList = productResponseJson
            .map((json) => ProductResponseDto.fromJson(json))
            .toList();
        return Right(productResponseList);
      } else {
        log('Server Error: ${response.body}');
        return Left(ServerFailure.fromResponse(
            response.statusCode, jsonDecode(response.body)));
      }
    } catch (e) {
      log('Exception: $e'); // Log exceptions
      return Left(ServerFailure('Failed to fetch products: $e'));
    }
  }
}
