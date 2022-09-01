//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/material.dart';
//
//
//class ImageSliders extends StatefulWidget {
//
//  const ImageSliders({
//    required this.image,
//    Key? key,
//  }) : super(key: key);
//  final String image;
//
//  @override
//  _ImageSlidersState createState() => _ImageSlidersState();
//}
//
//class _ImageSlidersState extends State<ImageSliders> {
//  CarouselController carouselController = CarouselController();
// // final cartController = Get.find<CartController>();
//  int currentPage = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: [
//        CarouselSlider.builder(
//          itemCount: 3,
//          carouselController: carouselController,
//          options: CarouselOptions(
//              height: 350,
//              autoPlay: true,
//              enlargeCenterPage: true,
//              enableInfiniteScroll: false,
//              autoPlayInterval: const Duration(seconds: 2),
//              viewportFraction: 1,
//              onPageChanged: (index, reson) {
//                setState(() {
//                  currentPage = index;
//                });
//              }),
//          itemBuilder: (context, index, realIndex) {
//            return Container(
//              margin: const EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                image:  DecorationImage(
//                  image: NetworkImage(image),
//                  fit: BoxFit.fill,
//                ),
//                borderRadius: BorderRadius.circular(5),
//              ),
//            );
//          },
//        ),
//    //  Positioned(
//    //    bottom: 30,
//    //    left: 180,
//    //    child: AnimatedSmoothIndicator(
//    //      activeIndex: currentPage,
//    //      count: 3,
//    //      effect: ExpandingDotsEffect(
//    //        dotHeight: 10,
//    //        dotWidth: 10,
//    //        activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
//    //        dotColor: Colors.black,
//    //      ),
//    //    ),
//    //  ),
//        Container(
//          padding: const EdgeInsets.only(
//            top: 20,
//            left: 25,
//            right: 25,
//          ),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              InkWell(
//                onTap: () {
//
//                },
//                child: Container(
//                  padding: const EdgeInsets.all(8),
//                  decoration: const BoxDecoration(
//                    color:Colors.grey,
//                    shape: BoxShape.circle,
//                  ),
//                  child: const Padding(
//                    padding:  EdgeInsets.only(left: 1),
//                    child: Icon(
//                      Icons.favorite_outline,
//                      color: Colors.white,
//                      size: 20,
//                    ),
//                  ),
//                ),
//              ),
         //  Obx(
         //        () => Badge(
         //      position: BadgePosition.topEnd(top: -10, end: -10),
         //      animationDuration: const Duration(milliseconds: 300),
         //      animationType: BadgeAnimationType.slide,
         //      badgeContent: Text(
         //        cartController.quantity().toString(),
         //        style: const TextStyle(color: Colors.white),
         //      ),
         //      child: InkWell(
         //        onTap: () {
         //         // Get.toNamed(Routes.cartScreen);
         //        },
         //        child: Container(
         //          padding: const EdgeInsets.all(8),
         //          decoration: BoxDecoration(
         //            color: Colors.grey,
         //            shape: BoxShape.circle,
         //          ),
         //          child: Icon(
         //            Icons.shopping_cart,
         //            color: Colors.white,
         //            size: 20,
         //          ),
         //        ),
         //      ),
         //    ),
         //  ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//}