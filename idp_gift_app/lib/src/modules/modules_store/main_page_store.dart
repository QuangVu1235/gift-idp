import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/assets/icon_assets.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/modules_store/main_page_store_model.dart';
import 'package:idp_gift_app/src/modules/modules_store/order_manager/order_manager_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/profile_store/profile_store_screen.dart';
import 'package:idp_gift_app/src/modules/modules_store/ware_house/ware_house_screen.dart';

import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';

import 'homepage_store/homepage_store.dart';

class MainPageStore extends StatefulWidget {
  const MainPageStore({Key? key, this.indexTab}) : super(key: key);
  final int? indexTab;

  @override
  State<MainPageStore> createState() => _MainPageState();
}

class _MainPageState extends ViewWidget<MainPageStore, MainPageStoreModel> {
  @override
  void initState() {
    super.initState();
    // viewModel.index.value = widget.indexTab ?? viewModel.index.value;
    // WidgetsBinding.instance?.addPostFrameCallback((_){
    //   if (!getIt<SharedPreferences>().containsKey('uToken')) {
    //     Get.off(const SigninPage());
    //     AppUtils().showPopup(
    //       title: 'Không thể truy cập',
    //       subtitle: 'Vui lòng đăng nhập để có thể sử dụng đầy đủ tính năng của phần mềm',
    //       isSuccess: false,
    //     );
    //   }
    // });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePageStore(),
    Text("1"),
    WareHouseScreen(),
    const ProfileStoreScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: [].contains(viewModel.index.value)
              ? null
              : AppBar(
                  backgroundColor: UIColors.white,
                  centerTitle: true,
                  title: Image.asset(ImageAssets.imgLogobanner, height: 40),
                  actions: [],
                  shape:
                      const Border(bottom: BorderSide(color: UIColors.black10)),
                ),
          body: Obx(() => _widgetOptions[viewModel.index.value]),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 5,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: UIColors.brandA,
              unselectedItemColor: Colors.black54,
              selectedLabelStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
              unselectedFontSize: 10,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: viewModel.index == 0
                        ? SvgPicture.asset(
                            SvgImageAssets.icHome,
                            color: UIColors.brandA,
                          )
                        : SvgPicture.asset(
                            SvgImageAssets.icHome,
                            color: UIColors.black40,
                          ),
                  ),
                  // icon: new Image.asset("resources/images/ic_dashboard_dashboard.png"),
                  label: "Trang chủ",
                ),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: viewModel.index == 1
                          ? Icon(Icons.content_paste)
                          : Icon(Icons.content_paste),
                    ),
                    label: "Đơn đổi quà"),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    width: 24,
                    height: 24,
                    child: viewModel.index == 2
                        ? SvgPicture.asset(
                            IconAssets.actionStore,
                            color: UIColors.brandA,
                            width: 10,
                          )
                        : SvgPicture.asset(IconAssets.actionStore,
                            color: UIColors.black40),
                  ),
                  // icon: new Image.asset("resources/images/ic_dashboard_dashboard.png"),
                  label: "Kho",
                ),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: viewModel.index == 3
                          ? SvgPicture.asset(
                              SvgImageAssets.icAccount,
                              color: UIColors.brandA,
                            )
                          : SvgPicture.asset(
                              SvgImageAssets.icAccount,
                              color: UIColors.black40,
                            ),
                    ),
                    label: "Tải khoản")
              ],
              currentIndex: viewModel.index.value,
              onTap: (index) {
                viewModel.index.value = index;
              },
            ),
          )),
    );
  }

  @override
  MainPageStoreModel createViewModel() => getIt<MainPageStoreModel>();
}
