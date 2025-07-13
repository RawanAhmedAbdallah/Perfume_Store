import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/products_api_controller.dart';
import 'package:forget_me_not/get/cart_getx_controller.dart';
import 'package:forget_me_not/models/api_response.dart';
import 'package:forget_me_not/models/cart.dart';
import 'package:forget_me_not/models/products.dart';
import 'package:forget_me_not/pref/shared_pref_controller.dart';
import 'package:forget_me_not/screens/products_details.dart';
import 'package:forget_me_not/widgets/ProductsCard.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key, this.id}) : super(key: key);
  

  final int? id;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
       // actions: [
       //   IconButton(
       //       onPressed: () {
       //         Navigator.push(
       //             context,
       //             MaterialPageRoute(
       //               builder: (context) => const ProductDetailsScreen(),
       //             ));
       //       },
       //       icon: const Icon(
       //         Icons.add,
       //       ))
       // ],
          iconTheme: IconThemeData(
            color: Colors.grey.shade700,
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Products',
            style: GoogleFonts.nunito(
              fontSize: 22,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder<List<Products>>(
            future: ProductsApiController().products(id: widget.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                print(snapshot.data!.length);
                return ListView.builder(
                    //scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                 //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 //       crossAxisCount: 1,
                 //       mainAxisSpacing: 12,
                 //       crossAxisSpacing: 12,
                 //       mainAxisExtent: 240
                 //   ),
                    itemBuilder: (context, index) {
                      return ProductsCard(
                        press: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                               id: snapshot.data![index].id)),
                           );
                           },
                               image: snapshot.data![index].imageUrl,
                               nameEn: snapshot.data![index].nameEn,
                               infoEn:snapshot.data![index].infoEn,
                               price: snapshot.data![index].price,
                         );
                      });
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
            })
    );
  }
  Cart getCart(Products product) {
    Cart cart = Cart();
    cart.total =double.parse(product.price) ;
    cart.price = double.parse(product.price) ;
    cart.count = 1;
    cart.userId = SharedPrefController().getValueFor<int>(key: PrefKeys.id.name)!;
    cart.productId = product.id;
    cart.imageUrl = product.imageUrl;
    cart.productName = product.nameEn;
    return cart;
  }
  Future<void> _create (Cart cart) async{
    ApiResponse apiResponse = await CartGetxController.to.create(cart);
    print(apiResponse.message);
  }

}
