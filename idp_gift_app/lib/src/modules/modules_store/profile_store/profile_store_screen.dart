import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/profiledetail_store/profile_detail_store_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/statistic_store/app/statistic_store_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/support_store/support_store_screen.dart';
import 'package:idp_gift_app/src/modules/signin_signup/app/signin/app/signin_screen.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_model.dart';

class ProfileStoreScreen extends StatefulWidget {
  const ProfileStoreScreen({Key? key}) : super(key: key);

  @override
  State<ProfileStoreScreen> createState() => _ProfileStoreScreenState();
}

class _ProfileStoreScreenState extends State<ProfileStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0.0,
                    color: Color(0xffF7F9FA),
                    // color: Colors.grey[200],
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CircleAvatar(

                            radius: 40,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              "resources/images/avt_profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Th??ng tin c?? nh??n",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "H??? v?? t??n",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Nguy???n V??n A",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "T??n c???a h??ng",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "C???a h??ng Th??? hu???",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "S??? ??i???n tho???i",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "0909012345",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "lephuchau@gmail.com",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Lo???i t??i kho???n",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Kh??ch h??ng",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ProfileDetailStoreScreen());

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: SvgPicture.asset(
                        "resources/images/profilepic.svg",
                        height: 40,
                      ),
                      title: Text(
                        "Th??ng tin c?? nh??n",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                    Get.to(StatisticStoreManageScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: Image.asset(
                        ImageAssets.chartbar,
                        height: 40,
                      ),
                      title: Text(
                        "Th???ng k??",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SupportStoreScreen());

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: SvgPicture.asset(
                        "resources/images/icon _support _female.svg",
                        height: 40,
                      ),
                      title: Text(
                        "H??? tr???",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: (){
                  Get.offAll(SigninPage());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: SvgPicture.asset(
                        "resources/images/icon_logout.svg",
                        height: 40,
                      ),
                      title: Text(
                        "????ng xu???t",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Version 3.9.11(2020126130)",
                style: TextStyle(
                    fontSize: 10, color: Colors.grey, letterSpacing: 0.5),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Hotline: 1900 10 01 11",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ));
  }
}
