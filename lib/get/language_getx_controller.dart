import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:get/get.dart';

class LanguageGetxController extends GetxController {
  static LanguageGetxController get to => Get.find<LanguageGetxController>();

  String? lang =
      SharedPrefController().getValueFor<String>(key: PrefKeys.language.name);

  Rx<String> language = SharedPrefController()
              .getValueFor<String>(key: PrefKeys.language.name) ==
          null
      ? 'en'.obs
      : SharedPrefController().getValueFor<String>(key: PrefKeys.language.name)!.obs;

  void changeLanguage() {
    language.value = language.value == 'en' ? 'ar' : 'en';
    SharedPrefController().changeLanguage(langCode: language.value);
  }
}

