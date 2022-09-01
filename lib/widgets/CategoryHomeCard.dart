import 'package:flutter/material.dart';

class CategoryHomeCard extends StatelessWidget {
  const CategoryHomeCard({
    Key? key, required this.press, required this.nameAr, required this.nameEn, required this.image,
  }) : super(key: key);
  final Function() press;
  final String nameAr;
  final String nameEn;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.shade300,
                    // boxShadow: [BoxShadow(
                    //   blurRadius: 2,
                    //   color: Colors.black26
                    // )]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                        child: Image.asset(
                          //snapshot.data!.categories[index].imageUrl
                          'images/gardenia.png',
                          height: 80,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0,left: 10,right: 10),
                          child: Column(
                            children: const [
                              Text('chanel'),
                              SizedBox(height: 1,),
                              Text('شانيل'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
          )]);
  }
}