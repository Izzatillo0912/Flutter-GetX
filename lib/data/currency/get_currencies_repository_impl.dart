import 'package:dio/dio.dart';
import 'package:getx_clean_architecture/data/common/api_service.dart';
import 'package:getx_clean_architecture/data/currency/model_currency.dart';
import 'package:getx_clean_architecture/domain/common/base_result.dart';
import 'package:getx_clean_architecture/domain/common/success.dart';
import 'package:getx_clean_architecture/domain/common/error.dart';
import 'package:getx_clean_architecture/domain/currency/get_currencies_repository.dart';

class GetCurrenciesRepositoryImpl extends GetCurrenciesRepository {

  @override
  Future<BaseResult<List<ModelCurrency>, String>> getCurrencies() async {

    Dio dio = ApiService().dio;

    try {

      final response = await dio.get('json/');

      List<ModelCurrency> data = (response.data as List)
          .map((it) => ModelCurrency.fromJson(it))
          .toList();

      print('[Success] Response data: ${response.data}');
      return Success(data);

    } on DioException catch (e) {

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return const Error("Connection timeout. Server bilan bog'lanib bo'lmadi.");
        case DioExceptionType.sendTimeout:
          return const Error("Send timeout. So'rov yuborilmadi.");
        case DioExceptionType.receiveTimeout:
          return const Error("Receive timeout. Javob vaqtini kutish tugadi.");
        case DioExceptionType.connectionError:
          return const Error("Connection Error");
        case DioExceptionType.badCertificate:
          return const Error("Bad Certificate");
        case DioExceptionType.badResponse:
          if (e.response?.statusCode == 500) {
            return const Error("Server error: 500. Iltimos, keyinroq qayta urinib ko'ring.");
          } else {
            return Error("HTTP error: ${e.response?.statusCode}. Message : ${e.response?.data}");
          }
        case DioExceptionType.cancel:
          return const Error("Request cancelled.");
        case DioExceptionType.unknown:
          return Error("Unknown error: ${e.message}");
      }
    } catch (e) {
      return Error("Unexpected error: $e");
    }

  }

}