
import 'package:get/get.dart';

import '../../../data/currency/get_currencies_repository_impl.dart';
import '../../../domain/currency/get_currencies_use_case.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetCurrenciesUseCase>(() =>
        GetCurrenciesUseCase(GetCurrenciesRepositoryImpl()));
  }
}