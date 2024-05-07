import 'package:dentist_appointment/screens/Doctor_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class reView extends StatefulWidget {

  @override
  State<reView> createState() => _reViewState();
}

class _reViewState extends State<reView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool IsScrolled) {
            return [
              SliverAppBar(
                title: Text("Reviews",style: GoogleFonts.urbanist(
              fontSize: 18,
              fontWeight: FontWeight.w600,)),
                centerTitle: true,
              )
            ];
          },
          body: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: ReviewItem(
                      username: 'Phumiphat Wongsathit',
                      rating: 4.5,
                      review: 'Great app, grear dentists, great everything.',
                      avatarImage: 'assets/reviewer1.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: ReviewItem(
                      username: 'Ben handsome',
                      rating: 4.5,
                      review: 'Dentist have good communications!.',
                      avatarImage: 'assets/reviewer1.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: ReviewItem(
                      username: 'Soft Saoyer',
                      rating: 4.5,
                      review: 'Nice experience.',
                      avatarImage: 'assets/reviewer1.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: ReviewItem(
                      username: 'Kla kodteh',
                      rating: 4.5,
                      review: 'Everything is perfect!.',
                      avatarImage: 'assets/reviewer1.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: ReviewItem(
                      username: 'Pee khongjing',
                      rating: 4.5,
                      review: 'I was not pain.',
                      avatarImage: 'assets/reviewer1.png',
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
