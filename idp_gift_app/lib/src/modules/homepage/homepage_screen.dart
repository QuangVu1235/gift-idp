import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/modules/gift_exchange/lof_gift_exchange/lof_gift_exchange_screen.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/image_slideshow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("resources/images/homepage_background.png",
                  ),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 8,
                child: ImageSlideshowGlobal(
                    width: double.infinity,
                    initialPage: 0,
                    indicatorColor: Colors.red,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                    },
                    autoPlayInterval:null,
                    isLoop: false,
                    children:  [
                      Image.asset(
                        'resources/images/img_boarding.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'resources/images/img_boarding.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'resources/images/img_boarding.png',
                        fit: BoxFit.fill,
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "CHƯƠNG TRÌNH ĐỔI QUÀ",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700, height: 2.4),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      // padding:
                      // const EdgeInsets.symmetric( vertical: 25),
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white, width: 0.5),
                          color: Color(0xffDBF6FF),
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height:145 ,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Image.asset(
                                "resources/images/logo_kun.png",
                                // height: 100,
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(LofGiftExchangeScreen(categoryId: 608,title: 'Đổi quà Kun',));
                              },
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      width: 1.5, color: Color(0xff086252)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  primary: Color(0xffDBF6FF)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                child: Text(
                                  "ĐỔI QUÀ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff086252)),
                                ),
                              )),
                          const SizedBox(
                              height: 8
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      // padding:
                      decoration: BoxDecoration(
                              color: Color(0xffFE0002),
                              borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 145,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Image.asset(
                                "resources/images/logo_lof.png",
                                // height: 100,
                                // width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(LofGiftExchangeScreen(categoryId: 607,title: 'Đổi quá Lof',));
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(width: 1, color: UIColors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: Color(0xffFE0002),
                              ),
                              child: const Padding(
                                padding:  EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                child: Text(
                                  "ĐỔI QUÀ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: UIColors.white),
                                ),
                              )),
                          const SizedBox(
                            height: 8
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
