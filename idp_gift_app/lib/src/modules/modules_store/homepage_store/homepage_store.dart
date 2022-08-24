import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/modules/modules_store/products_gift_exchange/products_gift_exchange.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class HomePageStore extends StatefulWidget {
  const HomePageStore({Key? key}) : super(key: key);

  @override
  State<HomePageStore> createState() => _HomePageStoreState();
}

class _HomePageStoreState extends State<HomePageStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "resources/images/homepage_background.png",
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "resources/images/img_boarding.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "DANH SÁCH CHƯƠNG TRÌNH ĐỔI QUÀ",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700, height: 2.4),
              ),
              const SizedBox(
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
                          color: const Color(0xffDBF6FF),
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 145,
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
                                Get.to(ProductGiftExchange());
                              },
                              style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      width: 1.5, color: Color(0xff086252)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  primary: const Color(0xffDBF6FF)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  "TẠO ĐƠN QUÀ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff086252)),
                                ),
                              )),
                          const SizedBox(height: 8)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .44,
                      // padding:
                      decoration: BoxDecoration(
                          color: const Color(0xffFE0002),
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
                                Get.to(const ProductGiftExchange());
                              },
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1, color: UIColors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                primary: const Color(0xffFE0002),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  "TẠO ĐƠN QUÀ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: UIColors.white),
                                ),
                              )),
                          const SizedBox(height: 8)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
