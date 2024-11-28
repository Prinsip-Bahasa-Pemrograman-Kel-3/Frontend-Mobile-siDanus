import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:si_danus/common/constant.dart';
import 'package:si_danus/pages/start_page.dart';
import 'package:si_danus/providers/on_boarding_provider.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;

  @override
  void initState() {
    _pageViewController = PageController();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: Stack(
            children: [
              Consumer<OnBoardingProvider>(
                builder: (context, onBoardingProvider, child) {
                  return PageView(
                    controller: _pageViewController,
                    onPageChanged: (value) {
                      onBoardingProvider.setCurrentIndex(value);
                      _pageViewController.animateToPage(
                        onBoardingProvider.currentIndex,
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.ease,
                      );
                      _tabController.index = onBoardingProvider.currentIndex;
                    },
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/png/onboarding-1.png"),
                            Text(
                              "Bangun Usaha Kamu dengan Mudah!",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Mulai perjalanan bisnismu tanpa ribet! Kami hadir untuk membantumu mendapatkan modal, mengelola keuangan, dan mempercepat perkembangan usaha. Ayo, wujudkan ide kreatifmu jadi nyata hanya dalam beberapa klik!",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/png/onboarding-2.png"),
                            Text(
                              "Kendalikan Bisnismu dengan Lebih Cerdas!",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Efisienkan waktu dengan memesan tempat sebelum datang ke lokasi tempat parkir.",
                              style: secondaryTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: medium,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Consumer<OnBoardingProvider>(
                    builder: (context, onBoardingProvider, child) {
                      return Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: GestureDetector(
                              onTap: () {
                                if (onBoardingProvider.currentIndex != 0) {
                                  onBoardingProvider.setCurrentIndex(
                                      onBoardingProvider.currentIndex - 1);
                                  _pageViewController.animateToPage(
                                    onBoardingProvider.currentIndex,
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    curve: Curves.ease,
                                  );
                                  _tabController.index =
                                      onBoardingProvider.currentIndex;
                                } else if (onBoardingProvider.currentIndex ==
                                    0) {
                                  Navigator.of(context).push(
                                    PageTransition(
                                      child: const StartPage(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                onBoardingProvider.currentIndex == 0
                                    ? "Lewati"
                                    : "Kembali",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          TabPageSelector(
                            selectedColor: secondaryColor,
                            controller: _tabController,
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 80,
                            child: GestureDetector(
                              onTap: () {
                                if (onBoardingProvider.currentIndex != 1) {
                                  onBoardingProvider.setCurrentIndex(
                                      onBoardingProvider.currentIndex + 1);
                                  _pageViewController.animateToPage(
                                    onBoardingProvider.currentIndex,
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    curve: Curves.ease,
                                  );
                                  _tabController.index =
                                      onBoardingProvider.currentIndex;
                                } else if (onBoardingProvider.currentIndex ==
                                    1) {
                                  Navigator.of(context).push(
                                    PageTransition(
                                      child: const StartPage(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Lanjut",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  color: primaryColor,
                                  fontWeight: medium,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
