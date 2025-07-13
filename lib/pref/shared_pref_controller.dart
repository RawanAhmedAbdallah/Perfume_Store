import 'package:forget_me_not/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum PrefKeys {
  id, email, cityId, name, mobile , gender , storeApiKey, token ,refreshToken, isLoggedIn,language
}

class SharedPrefController {

  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController(){
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  //save,clear, isLoggedIn, getByKey<T>, getToken
Future<void> save ({required User user}) async {
    print(user.token);
    await _sharedPreferences.setBool(PrefKeys.isLoggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.cityId.name, user.cityId);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
    await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
    await _sharedPreferences.setString(PrefKeys.refreshToken.name, 'Bearer ${user.refreshToken}');
}

void changeLanguage({required String langCode}) {
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }

Future<bool> clear() async =>  _sharedPreferences.clear();

bool get loggedIn => _sharedPreferences.getBool(PrefKeys.isLoggedIn.name) ?? false;

 T? getByKe<T>({required String key}) {
   if(_sharedPreferences.containsKey(key)){
     return _sharedPreferences.get(key) as T;
   }
   return null;
 }

 T? getValueFor<T>({required String key}) {
   if (_sharedPreferences.containsKey(key)) {
     return _sharedPreferences.get(key) as T;
   }
   return null;
 }
  Future<bool> removeValueFor(String key) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

 String get language =>
      _sharedPreferences.getString(PrefKeys.language.name) ?? 'en';

 String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';

}

