import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //!Navbar
    Widget navItem({required String title, required int index}) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title,
                style: GoogleFonts.poppins(
                    fontWeight: index == selectedIndex
                        ? FontWeight.w500
                        : FontWeight.w300,
                    fontSize: 18)),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == selectedIndex
                        ? Color(0xffFE998D)
                        : Colors.transparent),
                width: 66,
                height: 2)
          ],
        ),
      );
    }

    //! Content
    Widget contentIlus({required String imgUrl, required int index}) {
      return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: index == selectedIndex
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imgUrl,
                      height: 550,
                      width: 764,
                    )
                  ],
                )
              : null);
    }

    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/background.png',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 40,
                    width: 72,
                  ),
                  Spacer(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        navItem(
                          title: 'Guides',
                          index: 0,
                        ),
                        SizedBox(width: 48),
                        navItem(
                          title: 'Pricing',
                          index: 1,
                        ),
                        SizedBox(width: 48),
                        navItem(
                          title: 'Team',
                          index: 2,
                        ),
                        SizedBox(width: 48),
                        navItem(
                          title: 'Stories',
                          index: 3,
                        ),
                      ]),
                  Spacer(),
                  Image.asset('assets/btn.png', height: 53, width: 163)
                ],
              ),
              SizedBox(height: 100),
              // contentIlus(
              //   imgUrl: 'illustration.png', index: 0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/illustration.png',
                    height: 550,
                    width: 764,
                  )
                ],
              ),
              SizedBox(height: 84),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.arrow_drop_down_circle_rounded,
                  size: 45,
                  color: Color(0xffFE998D),
                ),
                SizedBox(width: 13),
                Text(
                  'Scroll to laern more',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w400),
                )
              ])
            ],
          ),
        ),
      ],
    ));
  }
}
