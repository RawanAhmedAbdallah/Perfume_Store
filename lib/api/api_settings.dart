class ApiSettings {
  static const String _baseUrl = 'https://smart-store.mr-dev.tech/api/';
  static const String users = '${_baseUrl}users';
  static const String register = '${_baseUrl}auth/register';
  static const String login = '${_baseUrl}auth/login';
  static const String refreshFcmToken = '${_baseUrl}auth/auth/refresh-fcm-token';
  static const String logout = '${_baseUrl}auth/logout';
  static const String forgetPassword = '${_baseUrl}auth/forget-password';
  static const String resetPassword = '${_baseUrl}auth/reset-password';
  static const String activateCode = '${_baseUrl}auth/activate-code';
  static const String changePassword = '${_baseUrl}auth/change-password';
  static const String updateProfile = '${_baseUrl}auth/update-profile';
  static const String cities = '${_baseUrl}cities';
  static const String categories = '${_baseUrl}categories';
  static const String subcategories = '${_baseUrl}categories/{id}';
  static const String addresses = '${_baseUrl}addresses/{id}';
  static const String home = '${_baseUrl}home';
  static const String offers = '${_baseUrl}offers';
  // static const String products = '${_baseUrl}sub-categories/{id}';
  static const String productsDet = '${_baseUrl}products/{id}';
  static const String favoriteProducts = '${_baseUrl}favorite-products';
  static const String rate = '${_baseUrl}products/rate';
  static const String products = '${_baseUrl}sub-categories/{id}';
  static const String paymentCards = '${_baseUrl}payment-cards/{id}';
  static const String contactRequests = '${_baseUrl}contact-requests';
  static const String faqs = '${_baseUrl}faqs';
}