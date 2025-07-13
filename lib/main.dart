import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:forget_me_not/database/db_controller.dart';
import 'package:forget_me_not/screens/auth/change_password.dart';
import 'package:forget_me_not/screens/auth/forget_password_screen.dart';
import 'package:forget_me_not/screens/auth/login_screen.dart';
import 'package:forget_me_not/screens/auth/register_screen.dart';
import 'package:forget_me_not/screens/auth/update_profile_screen.dart';
import 'package:forget_me_not/screens/cart_screen.dart';
import 'package:forget_me_not/screens/cart_submit_screen.dart';
import 'package:forget_me_not/screens/category_screen.dart';
import 'package:forget_me_not/screens/create_address_screen.dart';
import 'package:forget_me_not/screens/faqs_screen.dart';
import 'package:forget_me_not/screens/favorite_screen.dart';
import 'package:forget_me_not/screens/home_screen.dart';
import 'package:forget_me_not/screens/launch_screen.dart';
import 'package:forget_me_not/screens/notification_screen.dart';
import 'package:forget_me_not/screens/onboarding_screen/on_board_screen.dart';
import 'package:forget_me_not/screens/onboarding_screen/on_board_screen2.dart';
import 'package:forget_me_not/screens/order_details_screen.dart';
import 'package:forget_me_not/screens/order_screen.dart';
import 'package:forget_me_not/screens/payment_screen.dart';
import 'package:forget_me_not/screens/products_details.dart';
import 'package:forget_me_not/screens/products_screen.dart';
import 'package:forget_me_not/screens/settings_screen.dart';
import 'package:forget_me_not/screens/show_address_screen.dart';
import 'package:forget_me_not/screens/sub_category_screen.dart';
import 'pref/shared_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
 //await Firebase.initializeApp(
 //  options: DefaultFirebaseOptions.currentPlatform,
 //);
 // await FbNotifications.initNotifications();
 // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await SharedPrefController().initPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: const Locale('en'),
      // supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/on_board_screen': (context) => const OnBoardScreen(),
        '/on_board_screen2': (context) => const OnBoardScreen2(),
        '/login_screen': (context) => const LoginScreen(),
        '/register_screen': (context) => const RegisterScreen(),
        '/forgot_password_screen': (context) => const ForgetPasswordScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/category_screen': (context) => const CategoryScreen(),
        '/sub_category_screen': (context) => const SubCategoryScreen(),
        '/products_screen': (context) => const ProductsScreen(),
        '/products_details_screen': (context) => const ProductDetailsScreen(),
        '/favorite_screen': (context) =>  FavoritesScreen(),
        '/cart_screen': (context) =>  const CartScreen(),
        '/cart_submit_screen': (context) =>  const CartSubmitScreen(),
        '/order_screen': (context) => const OrderScreen(),
        '/order_details_screen': (context) => const OrderDetailsScreen(),
        '/payment_screen': (context) => const PaymentScreen(),
        '/notification_screen': (context) =>  const NotificationScreen(),
        '/settings_screen': (context) =>  const SettingsScreen(),
        '/change_screen': (context) =>  const ChangePassword(),
        '/create_address_screen': (context) =>  const CreateAddressScreen(),
        '/show_address_screen': (context) =>  const ShowAddressScreen(),
        '/update_profile_screen': (context) => const UpdateProfileScreen(),
        '/faqs_screen': (context) => const FaqsScreen(),
      },
    );
  }
}