import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noticeboard_system/core/styles.dart';
import 'package:noticeboard_system/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 2000,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.6,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.of(context).pushReplacementNamed(NoticeBoardScreen.login);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return AnnotatedRegion(
      value: SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.leanBack,
        overlays: [],
      ),
      child: Scaffold(
        body: GradientTile(
          // animationsMap: animationsMap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Image.asset(
                    Assets.logo,
                    width: 100,
                    //fit: BoxFit.fitWidth,
                  ).animated([animationsMap['imageOnPageLoadAnimation']!]),
                ),
              ),
              SizedBox(
                height: SizeConfig.minBlockVertical! * 5,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                child: Column(
                  children: [
                    Text(
                      "Information Dissemination System",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical! * 3,
                    ),
                    Text(
                      "By",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical! * 3,
                    ),
                    Text(
                      "DIM IFEANYI EMMANUEL   19/1434",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical! * 3,
                    ),
                    Text(
                      "EBITU MARIAM NSIEN         18/0030",
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.minBlockVertical! * 3,
                    ),
                    Text(
                      "NWANKOTA CHIEMENA EMMANUEL         18/2386",
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
