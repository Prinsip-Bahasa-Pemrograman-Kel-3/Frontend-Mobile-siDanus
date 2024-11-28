import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:si_danus/common/constant.dart';
import 'package:si_danus/pages/sign_in_page.dart';
import 'package:si_danus/widgets/custom_button_widget.dart';
import 'package:si_danus/widgets/custom_modal_bottom_sheet_widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  signUp() {
    showModal(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Selamat Datang",
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Text(
            "Daftar sebagai",
            style: secondaryTextStyle,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustomButtonWidget(
            text: "Daftar Mitra",
            color: white,
            icon: Icon(
              Icons.shopping_bag,
              color: primaryColor,
            ),
            isLoading: false,
            isDefaultTextStyle: false,
            onPressed: () {},
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustomButtonWidget(
            text: "Daftar",
            color: primaryColor,
            icon: Icon(
              Icons.person,
              color: white,
            ),
            isLoading: false,
            onPressed: () {},
          ),
          SizedBox(
            height: defaultPadding,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              signIn();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sudah memiliki akun? ",
                  style: secondaryTextStyle.copyWith(
                    color: grey400,
                  ),
                ),
                Text(
                  "Masuk",
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }

  signIn() {
    showModal(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Selamat Datang",
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Text(
            "Masuk sebagai",
            style: secondaryTextStyle,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustomButtonWidget(
            text: "Masuk Mitra",
            color: white,
            icon: Icon(
              Icons.shopping_bag,
              color: primaryColor,
            ),
            isLoading: false,
            isDefaultTextStyle: false,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                PageTransition(
                  child: const SignInPage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustomButtonWidget(
            text: "Masuk",
            color: primaryColor,
            icon: Icon(
              Icons.person,
              color: white,
            ),
            isLoading: false,
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                PageTransition(
                  child: const SignInPage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
          ),
          SizedBox(
            height: defaultPadding,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              signUp();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum memiliki akun? ",
                  style: secondaryTextStyle.copyWith(
                    color: grey400,
                  ),
                ),
                Text(
                  "Daftar",
                  style: secondaryTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: height(context) * 0.2,
                ),
                Center(
                  child: Image.asset("assets/png/polban-logo.png"),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "siDanus",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 50,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  "Jual beli usahamu\nmenjadi lebih cepat",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButtonWidget(
                  text: "Mulai Sekarang",
                  color: primaryColor,
                  isLoading: false,
                  onPressed: () {
                    signUp();
                  },
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sudah memiliki akun",
                        style: secondaryTextStyle,
                      ),
                      SizedBox(
                        width: defaultPadding,
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
