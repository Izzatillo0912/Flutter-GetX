
import 'package:getx_clean_architecture/data/currency/model_currency.dart';
import '../common/base_result.dart';

abstract class GetCurrenciesRepository {

  Future<BaseResult<List<ModelCurrency>, String>> getCurrencies();

}