import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/utils/pageState/is_error.dart';
import 'package:getx_clean_architecture/presentation/utils/pageState/is_loading.dart';
import 'package:getx_clean_architecture/presentation/utils/pageState/is_success.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {

        final state = controller.currenciesState.value;

        if(state is IsLoading) {
          print("isLoading");
        }
        else if(state is IsSuccess) {
          print("isSuccess data : ${state.data}");
        }
        else if(state is IsError) {
          print("error : ${state.errorMessage}");
        }

        return ElevatedButton(onPressed: (){
          controller.fetchCurrencies();
        }, child: Text("Curenncies"));
      })
    );
  }

}