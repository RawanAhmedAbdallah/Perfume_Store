import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF9F5F2),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Color(0xFFE5789D),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.montserrat(
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFF9F5F2),
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  height: 120,
                  // color: Colors.deepOrange,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const[BoxShadow(
                        offset: Offset(0,0),
                        color: Colors.white
                      //blurRadius: 1,
                    )],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: ListView(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title',style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                                const SizedBox(height: 5,),
                                Text('Content',style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                                const SizedBox(height: 5,),
                                Text('Data',style: GoogleFonts.lato(fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Spacer(),
                          //  IconButton(
                          //    onPressed: () async => await delete(index: index),
                          //    icon: const Icon(
                          //      Icons.delete,
                          //      color: Color(0xFFE5789D),
                          //    ),
                          //  )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
