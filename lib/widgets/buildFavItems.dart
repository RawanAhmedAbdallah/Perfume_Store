import 'package:flutter/material.dart';


class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({
    Key? key, required this.imageUrl, required this.nameEn, required this.productsId, required this.press,
  }) : super(key: key);
  final Function() press;
  final String imageUrl;
  final String nameEn;
  final int productsId;

  @override
  Widget build(BuildContext context) {
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
                press;
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
  }}