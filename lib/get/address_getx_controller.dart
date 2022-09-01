import 'package:get/get.dart';
import 'package:forget_me_not/api/controllers/address_api_controller.dart';
import 'package:forget_me_not/models/addresses.dart';
import 'package:forget_me_not/models/api_response.dart';

class AddressGetxController extends GetxController {
  RxBool loading = false.obs;
  RxList<Address> addresses = <Address>[].obs;
  final AddressApiController _apiController = AddressApiController();

  static AddressGetxController get to => Get.find<AddressGetxController>();

  @override
  void onInit() {
    // TODO: implement onInit
    readAddress();
    super.onInit();
  }

  void readAddress() async {
    loading.value = true;
    addresses.value = await _apiController.readAddress();
    loading.value = false;
  }

  Future<ApiResponse> createAddress({required String name, required String info, required String contactNumber, required int cityId }) async {
    ApiResponse apiResponse =
    await _apiController.createAddress(name: name,info: info,contactNumber: contactNumber,cityId: cityId);
    if (apiResponse.success) {
      addresses.add(apiResponse.object);
    }
    return apiResponse;
  }

  // Future<ApiResponse> updateAddress({required int index}) async {
  //   ApiResponse apiResponse =
  //   await _apiController.updateAddress(index: addresses[index].id);
  //   if (apiResponse.success) {
  //     addresses.indexWhere;
  //   }
  //   return apiResponse;
  // }

  Future<ApiResponse> deleteAddress({required int id}) async {
    ApiResponse apiResponse =
    await _apiController.deleteAddress(id: id);
    if (apiResponse.success) {
      addresses.removeAt(id);
    }
    return apiResponse;
  }

}

