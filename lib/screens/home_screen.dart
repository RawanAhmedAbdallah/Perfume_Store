import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forget_me_not/api/controllers/auth_api_controller.dart';
import 'package:forget_me_not/get/favorite_getx_controller.dart';
import 'package:forget_me_not/models/home.dart';
import 'package:forget_me_not/new_model/home_api_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/screens/auth/login_screen.dart';
import 'package:forget_me_not/screens/cart_screen.dart';
import 'package:forget_me_not/screens/category_screen.dart';
import 'package:forget_me_not/screens/favorite_screen.dart';
import 'package:forget_me_not/screens/auth/update_profile_screen.dart';
import 'package:forget_me_not/screens/settings_screen.dart';
import 'package:forget_me_not/utils/helpers.dart';

class HomeScreen extends StatefulWidget with Helpers {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Helpers {
  FavoriteGetxController controller =
  Get.put<FavoriteGetxController>(FavoriteGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F5F2),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.grey.shade700,
        ),
        title: Text(
          'Home',
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: const Color(0xFFF9F5F2),
          child: Container(
            color: const Color(0xFFF9F5F2),
            padding: const EdgeInsets.only(left: 20),
            child: ListView(padding: const EdgeInsets.all(4.0), children: [
              const DrawerHeader(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/img8.jpg'),
                ),
              ),
              const SizedBox(height: 5,),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UpdateProfileScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite_outlined),
                title: Text(
                  'Favorite',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_sharp),
                title: Text(
                  'Cart',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                   );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ]),
          ),
        ),
      ),
      body: FutureBuilder<Home?> (
          future: HomeApiController().read(),//HomeApiController().getHome(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              print(snapshot.data!.slider.length);
              //margin: const EdgeInsets.all(15),
              return ListView(
                  scrollDirection: Axis.vertical,
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [
                    CarouselSlider.builder(
                      itemCount: snapshot.data!.slider.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        reverse: false,
                        aspectRatio: 5.0,
                      ),
                      itemBuilder: (context, i, id) {
                        //for onTap to redirect to another screen
                        return GestureDetector(
                          //ClipRRect for image border radius
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              snapshot.data!.slider[i].imageUrl,
                              fit: BoxFit.cover,
                              //'images/img7.jpg',
                              width: 300,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Categories',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 190,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF9DEC2BA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (
                                  context) => const CategoryScreen()),
                            );
                          },

                          child: Text('All', style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      height: 128,
                      child: GridView.builder(
                        itemCount: snapshot.data!.categories.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 140,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          // color: Colors.grey.shade300,
                                          // boxShadow: [BoxShadow(
                                          //   blurRadius: 2,
                                          //   color: Colors.black26
                                          // )]
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          children: [
                                            ClipRRect(
                                              borderRadius: const BorderRadius
                                                  .only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12),
                                              ),
                                              child: Image.network(
                                                //snapshot.data!.categories[index].imageUrl
                                                snapshot.data!.categories[index]
                                                    .imageUrl,
                                                height: 80,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(height: 5,),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 0,
                                                    left: 10,
                                                    right: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      snapshot.data!
                                                          .categories[index]
                                                          .nameEn,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                          fontWeight: FontWeight
                                                              .bold),),
                                                    //Text(
                                                    //  snapshot.data!
                                                    //      .categories[index]
                                                    //      .nameAr,
                                                    //  style: GoogleFonts
                                                    //      .montserrat(
                                                    //      fontWeight: FontWeight
                                                    //          .bold),),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ))
                                )
                              ]);
                        },
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Latest Products',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(width: 135,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF9DEC2BA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const LatestProducts()),
                            // );
                          },

                          child: Text(
                            'All', style: GoogleFonts.montserrat(fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                    GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.latestProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 280
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              //color: Colors.black12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children:[
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:Colors.grey.shade400,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Padding(
                                        padding:  EdgeInsets.only(left: 1),
                                        child: Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],),
                                ClipRRect(borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),

                                  child: Image.network(
                                    snapshot.data!.latestProducts[index]
                                        .imageUrl,
                                    height: 170,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data!.latestProducts[index]
                                              .nameEn,
                                          style: GoogleFonts.nunito(),),

                                        //Text('شانيل ',style: GoogleFonts.nunito(),),

                                        Text(
                                          snapshot.data!.famousProducts[index]
                                              .price,
                                          style: GoogleFonts.nunito(),),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Famous Products',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(width: 120,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF9DEC2BA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const LatestProducts()),
                            // );
                          },

                          child: Text('All', style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.famousProducts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 280
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              //color: Colors.black12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children:[
                                   Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:Colors.grey.shade400,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Padding(
                                        padding:  EdgeInsets.only(left: 1),
                                        child: Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                    ],),
                                ClipRRect(borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),

                                  child: Image.network(
                                    snapshot.data!.famousProducts[index]
                                        .imageUrl,
                                    height: 170,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data!.famousProducts[index]
                                              .nameEn,
                                          style: GoogleFonts.nunito(),),

                                        //Text('شانيل ',style: GoogleFonts.nunito(),),

                                        Text(
                                          snapshot.data!.famousProducts[index]
                                              .price,
                                          style: GoogleFonts.nunito(),),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),

                  ]);
            }
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.montserrat(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
              ),
            );
          }));

  }

  Future<void> logout(BuildContext context) async {
    ApiResponse apiResponse = await AuthApiController().logout();
    if (apiResponse.success) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
    showSnackBar(
      context,
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
    }