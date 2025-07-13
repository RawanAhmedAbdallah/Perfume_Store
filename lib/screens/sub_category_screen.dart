import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/sub_category_api_controller.dart';
import 'package:forget_me_not/models/sub_category.dart';
import 'package:forget_me_not/screens/products_screen.dart';
import 'package:forget_me_not/widgets/SubCategoryCard.dart';
import 'package:google_fonts/google_fonts.dart';


class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key, this.id}) : super(key: key);
  final int? id;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           iconTheme: IconThemeData(color: Colors.grey.shade700,),
           elevation: 0,
           backgroundColor: Colors.transparent,
           centerTitle: true,
           title: Text('Sub Category',
             style: GoogleFonts.nunito(
                 fontSize: 22,
               color: Colors.grey.shade700,
                 fontWeight: FontWeight.bold,),),
         ),

       body:FutureBuilder<List<SubCategory?>>(
        future: SubCategoryApiController().getSubCategory(id: widget.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
                return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 260
                ),
                itemBuilder: (context, index) {
                  return SubCategoryCard(
                      nameEn: snapshot.data![index]!.nameEn,
                      //nameAr: snapshot.data![index]!.nameAr,
                      image: snapshot.data![index]!.imageUrl,
                      click: (){
                        Navigator.push(
                          context,
                            MaterialPageRoute(builder: (context) => ProductsScreen(
                              id: snapshot.data![index]?.id,
                        )),
                        );
                      }
                  );
                }
            );
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
        }
       )
       );
  }
}

