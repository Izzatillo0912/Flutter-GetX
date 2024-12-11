
import 'package:getx_clean_architecture/data/currency/model_currency.dart';
import 'package:getx_clean_architecture/domain/common/base_result.dart';

import 'get_currencies_repository.dart';

class GetCurrenciesUseCase {

  final GetCurrenciesRepository getCurrenciesRepository;

  GetCurrenciesUseCase(this.getCurrenciesRepository);

  Future<BaseResult<List<ModelCurrency>, String>> execute() async {
    return await getCurrenciesRepository.getCurrencies();
  }
}