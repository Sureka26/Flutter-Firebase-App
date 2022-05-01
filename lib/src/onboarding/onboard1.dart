import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardPage1 extends StatelessWidget {
  const OnBoardPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/onboard_images/onboard1.svg',
            height: 200.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Anyone can cook',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w800,
              color: Colors.indigo,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Easy recipes which you don’t have to worry about the complex process !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              color: Color(0xff2F4093),
            ),
          ),
        ],
      ),
    );
  }
}
