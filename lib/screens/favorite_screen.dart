
import 'package:flutter/material.dart';
import 'package:forget_me_not/get/favorite_getx_controller.dart';
import 'package:forget_me_not/utils/helpers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatefulWidget with Helpers {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final controller = Get.put(FavoriteGetxController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5F2),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey.shade700,),
        backgroundColor: const Color(0xFFF9F5F2),
        centerTitle: true,
        elevation: 0,
        title: Text('Favorite List', style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold, color: Colors.grey.shade700,),),
      ),
      body:
      GetX<FavoriteGetxController>(
        // init: ImagesGetxController(),
        // global: true,
        builder: (FavoriteGetxController controller) {
          if (controller.loading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.products.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(Icons.favorite_outline, size: 60,),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Please, Add your favorites products',
                      style: GoogleFonts.montserrat(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  imageUrl: controller.products[index].imageUrl,
                  //nameAr: controller.products[index].nameAr,
                  nameEn: controller.products[index].nameEn,
                  productsId: controller.products[index].id,

                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.products.length,
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required String imageUrl,
    required String nameEn,
    required int productsId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   nameAr,
                  //   style: const TextStyle(
                  //     overflow: TextOverflow.ellipsis,
                  //     color: Colors.black,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    nameEn,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.products.removeAt(productsId);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

//Future<void> _deleteFav({required int index}) sasync {
//  ApiResponse apiResponse = await FavoriteGetxController.to.deleteFav(productId: );
//  showSnackBar(context, message: apiResponse.message, error: !apiResponse.success);
//}
}

