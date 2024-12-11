
import 'package:getx_clean_architecture/presentation/utils/pageState/page_state.dart';

class IsSuccess extends PageState {
  final dynamic data;
  final String? successMessage;

  IsSuccess({required this.data, this.successMessage});
}