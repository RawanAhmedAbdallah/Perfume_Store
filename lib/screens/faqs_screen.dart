import 'package:flutter/material.dart';
import 'package:forget_me_not/api/controllers/faqs_api_controller.dart';
import 'package:forget_me_not/models/faqs.dart';
import 'package:google_fonts/google_fonts.dart';


class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF9F5F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9F5F2),
          iconTheme: const IconThemeData(color:  Color(0xFFE5789D),),
          elevation: 0,
          centerTitle: true,
          title: Text('FAQs',style: GoogleFonts.montserrat(color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
        ),
   body: FutureBuilder<List<Faqs?>> (
  future: FaqsApiController().read(),
  builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return const Center(child: CircularProgressIndicator());
  } else if (snapshot.hasData) {
  print(snapshot.data!.length);
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          onExpansionChanged: (bool expanded) {},
          leading: Icon(Icons.question_answer),
          collapsedBackgroundColor: Color(0xFFD3CEDF),
          collapsedTextColor: Colors.white,
          backgroundColor: Color(0xFFF2D7D9),
          title: Text(
             snapshot.data![index]!.questionEn,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.center,
          expandedAlignment: Alignment.topLeft,
          tilePadding: EdgeInsets.all(10),
          childrenPadding: EdgeInsets.all(10),
          textColor: Color(0xFFE5789D),
          initiallyExpanded: true,
          iconColor: Color(0xFFE5789D),
          collapsedIconColor: Colors.pink,
          children: [
            Text(
              snapshot.data![index]!.answerEn
              // textAlign: TextAlign.start,
            ),
          ],
        );
      },

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
  }));
}
}
