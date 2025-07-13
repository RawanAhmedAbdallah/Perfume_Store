import 'package:get/get.dart';
import 'package:forget_me_not/api/controllers/address_api_controller.dart';
import 'package:forget_me_not/models/addresses.dart';
import 'package:forget_me_not/models/api_response.dart';

class AddressGetxController extends GetxController {



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

  Future<ApiResponse> createAddress({required String name,
    required String info, required String contactNumber, required int cityId }) async {
    ApiResponse<Address> apiResponse =
    await _apiController.createAddress(name: name,info: info,
        contactNumber: contactNumber,cityId: cityId);
    if (apiResponse.success && apiResponse.object != null) {
      addresses.add(apiResponse.object!);
    }
    return apiResponse;
  }

  Future<ApiResponse> updateAddress({required int index}) async {
    ApiResponse apiResponse =
    await _apiController.updateAddress(id: addresses[index].id);
    if (apiResponse.success) {
      addresses.indexWhere;
    }
    return apiResponse;
  }

  Future<ApiResponse> delete({required int index}) async {
    ApiResponse apiResponse = await _apiController.delete(id: addresses[index].id);
    if (apiResponse.success) {
      addresses.removeAt(index);
    }
    return apiResponse;
  }
}

