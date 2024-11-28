import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:si_danus/common/constant.dart';
import 'package:si_danus/widgets/custom_button_widget.dart';
import 'package:si_danus/widgets/custom_text_form_field_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SizedBox(
        width: width(context),
        height: height(context),
        child: Stack(
          children: [
            SvgPicture.asset("assets/svg/bubble-02.svg"),
            SvgPicture.asset("assets/svg/bubble-01.svg"),
            Positioned(
              right: 1,
              top: height(context) * 0.4,
              child: SvgPicture.asset("assets/svg/bubble-03.svg"),
            ),
            Positioned(
              right: 1,
              bottom: -150,
              child: SvgPicture.asset("assets/svg/bubble-04.svg"),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height(context) * 0.4,
                    ),
                    Text(
                      "Masuk",
                      style: secondaryTextStyle.copyWith(
                        fontSize: 40,
                        fontWeight: extraBold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Senang melihat anda kembali! ",
                          style: secondaryTextStyle,
                        ),
                        Icon(
                          Icons.favorite,
                          color: black1,
                          size: 15,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: CustomTextFormFieldWidget(
                        hintText: "Email",
                        isPasswordField: false,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: CustomTextFormFieldWidget(
                        hintText: "Kata sandi",
                        isPasswordField: false,
                        controller: passwordController,
                        type: TextInputType.text,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    CustomButtonWidget(
                      text: "Masuk",
                      color: primaryColor,
                      isLoading: false,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Batal",
                          style: secondaryTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
