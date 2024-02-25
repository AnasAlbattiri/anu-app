import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TasbehController extends GetxController{
  RxInt counter = 0.obs;
  GetStorage storage = GetStorage();
  void addToCounter(){
     counter++;
  }

  void resetCounter(){
    counter.value = 0;
  }

}