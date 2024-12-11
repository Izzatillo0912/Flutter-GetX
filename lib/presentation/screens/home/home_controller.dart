import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/utils/pageState/is_init.dart';
import 'package:getx_clean_architecture/presentation/utils/pageState/page_state.dart';

import '../../../domain/currency/get_currencies_use_case.dart';
import '../../utils/pageState/is_error.dart';
import '../../utils/pageState/is_loading.dart';
import '../../utils/pageState/is_success.dart';

class HomeController extends GetxController {

  final GetCurrenciesUseCase getCurrenciesUseCase = Get.find();

  var currenciesState = (IsInit() as PageState).obs;

  HomeController() {
   currenciesState.value = IsInit();
   fetchCurrencies();
  }

  Future<void> fetchCurrencies() async {
    currenciesState.value = IsLoading(isLoading: "Yuklanmoqda..");

    final result = await getCurrenciesUseCase.execute();

    result.when(
      success: (data) {
        currenciesState.value = IsSuccess(
            data: data, successMessage: "Ma'lumot muvaffaqiyatli olindi");
      },
      failure: (error) {
        currenciesState.value = IsError(errorMessage: error);
      },
    );
  }
}