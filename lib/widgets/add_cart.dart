import 'package:flutter/material.dart';
import 'package:get/get.dart';

//class AddCart extends StatelessWidget {
//  final double price;
//  final Products products;
//  AddCart({
//    required this.price,
//    required this.products,
//    Key? key,
//  }) : super(key: key);
//  final controller = Get.find<CartController>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      padding: const EdgeInsets.all(25),
//      child: Row(
//        children: [
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [
//             // TextUtils(
//             //   fontSize: 16,
//             //   fontWeight: FontWeight.bold,
//             //   text: "Price",
//             //   color: Colors.grey,
//             //   underLine: TextDecoration.none,
//             // ),
//              Text(
//                "\$$price",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontSize: 20,
//                  fontWeight: FontWeight.bold,
//                  height: 1.5,
//                ),
//              ),
//            ],
//          ),
//          const SizedBox(
//            width: 20,
//          ),
//          Expanded(
//            child: SizedBox(
//              height: 60,
//              child: ElevatedButton(
//                style: ElevatedButton.styleFrom(
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(15),
//                  ),
//                  elevation: 0,
//                  primary: Colors.grey
//                ),
//                onPressed: () {
//                  controller.addProductToCart(products);
//                },
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: const [
//                    Text(
//                      "Add to Cart",
//                      style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 20,
//                      ),
//                    ),
//                    SizedBox(
//                      width: 10,
//                    ),
//                    Icon(
//                      Icons.shopping_cart_outlined,
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}