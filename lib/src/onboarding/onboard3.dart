import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardPage3 extends StatelessWidget {
  const OnBoardPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/onboard_images/onboard3.svg',
            height: 200.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'New Recipes every week',
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
            'Tired of cooking same dish again and again? Foodie is here to lift the bear ! Enjoy brand new recipes every week !',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w600,
              color: Color(0xff2F4093),
            ),
          )
        ],
      ),
    );
  }
}
