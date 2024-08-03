import 'package:flutter/material.dart';

class TransparentLogoWidget extends StatelessWidget {
  const TransparentLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height * 0.26,
          child: Image.asset(
            "assets/images/ibnt_logo.png",
            opacity: const AlwaysStoppedAnimation(0.5),
          ),
        ),
        SizedBox(height: height * 0.015),
        Text(
          "IBNT",
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontFamily: 'Karma',
            fontSize: 40,
          ),
        ),
        SizedBox(height: height * 0.015),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "I",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Karma',
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: "GREJA ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Karma',
                  fontSize: 17,
                ),
              ),
              TextSpan(
                text: "B",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Karma',
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: "ATISTA",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Karma',
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "N",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Karma',
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: "ACIONAL ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Karma',
                  fontSize: 17,
                ),
              ),
              TextSpan(
                text: "EM ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Karma',
                  fontSize: 17,
                ),
              ),
              TextSpan(
                text: "T",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Karma',
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: "URMALINA",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: 'Karma',
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
