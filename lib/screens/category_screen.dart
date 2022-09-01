import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/category_api_controller.dart';
import 'package:forget_me_not/models/category.dart';
import 'package:forget_me_not/screens/sub_category_screen.dart';
import 'package:forget_me_not/widgets/CategoryCard.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key,this.id}) : super(key: key);
  final int? id;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF9F5F2),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey.shade700,),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text('Categories',
            style: GoogleFonts.nunito(
              fontSize: 22,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,),
            ),
          ),

            body:FutureBuilder<List<Category?>>(
              future: CategoryApiController().getCat(),
              builder: (context, snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  print(snapshot.data!.first!.image);
                  return
                    GridView.builder(
                      //scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      shrinkWrap: true,
                     // physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          mainAxisExtent: 260
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  SubCategoryScreen(id: snapshot.data![index]?.id,

                              )),
                            );
                          },
                          nameEn: snapshot.data![index]!.nameEn,
                          image: snapshot.data![index]!.imageUrl,
                       );
                      }
                   );
    }return Center(
              child: Text(
              'NO DATA',
              style: GoogleFonts.montserrat(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
             ),
              ),
             );
            }
          )
       ));
  }
}

