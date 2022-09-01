import 'package:flutter/material.dart';
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
        appBar: AppBar(
          title: Text('FAQs'),
        )
//    body: FutureBuilder<Faqs?> (
//   future: Fa,
//   builder: (context, snapshot) {
//   if (snapshot.connectionState == ConnectionState.waiting) {
//   return const Center(child: CircularProgressIndicator());
//   } else if (snapshot.hasData) {
//   //print(snapshot.data!.faqs.length);
//     return ListView.builder(
//       itemCount: 2,
//       itemBuilder: (context, index) {
//         return ExpansionTile(
//           onExpansionChanged: (bool expanded) {},
//           leading: Icon(Icons.question_answer),
//           collapsedBackgroundColor: Color(0xFFD3CEDF),
//           collapsedTextColor: Colors.white,
//           backgroundColor: Color(0xFFF2D7D9),
//           title: Text(
//              // _faqs[index].question
//           'sjjsssssssss',
//           ),
//           expandedCrossAxisAlignment: CrossAxisAlignment.center,
//           expandedAlignment: Alignment.topLeft,
//           tilePadding: EdgeInsets.all(10),
//           childrenPadding: EdgeInsets.all(10),
//           textColor: Colors.red,
//           initiallyExpanded: true,
//           iconColor: Colors.blue,
//           collapsedIconColor: Colors.pink,
//           children: [
//             Text(
//               //_faqs[index].answer,
//               'jjjjjjjjjjjjjjjj'
//               // textAlign: TextAlign.start,
//             ),
//           ],
//         );
//       },

//   );
// }
//   return Center(
//   child: Text(
//     'NO DATA',
//     style: GoogleFonts.montserrat(
//     fontSize: 23,
//     fontWeight: FontWeight.bold,
//     color: Colors.grey.shade700,
//     ),
//     ),
//     );
//   }));
// }
    );
  }}