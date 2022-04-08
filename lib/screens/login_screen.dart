import 'package:flutter/material.dart';
import 'package:shopx_ecommerce_dribble_design/constants.dart';
import 'package:shopx_ecommerce_dribble_design/screens/home_screen.dart';
import 'package:shopx_ecommerce_dribble_design/widgets/rounded_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBackGround,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Solution of searching product from 2000',
                      style: kLightGrayText,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'All that you need,\nAll that you want\njust here at all!',
                      style: kBigWhiteText,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/lens.jpg'),
                        fit: BoxFit.contain)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      text: 'Create an account',
                      color: kDarkGray,
                      textColor: Colors.white,
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                    ),
                    RoundedButton(
                      text: 'Sign in',
                      color: Colors.white,
                      textColor: Colors.black,
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: "By proceeding, I accept the ",
                          style: kLightGrayText,
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Shopx Shopping Service \n',
                                style: TextStyle(
                                    decorationThickness: 3.5,
                                    decoration: TextDecoration.underline)),
                            TextSpan(
                              text: 'and confirm that I have read ',
                            ),
                            TextSpan(
                                text: ' Klarna\'s Privacy Policy \n',
                                style: TextStyle(
                                    decorationThickness: 3.5,
                                    decoration: TextDecoration.underline)),
                            TextSpan(
                              text: 'Links in the app are sponsored.',
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
