// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../main.dart' as _i17;
import '../apis/address/address_api.dart' as _i30;
import '../apis/address/address_datasource.dart' as _i31;
import '../apis/customer/customer_api.dart' as _i33;
import '../apis/customer/customer_datasoure.dart' as _i34;
import '../apis/customer/gift_exchange_place.dart' as _i15;
import '../apis/customer/gift_exchange_place_datasource.dart' as _i16;
import '../apis/forget_password/forget_password_datasource.dart' as _i13;
import '../apis/forget_password/services/forget_password_api.dart' as _i12;
import '../apis/idp/kun/product_datasource.dart' as _i19;
import '../apis/idp/kun/service/product_api.dart' as _i18;
import '../apis/signin/services/signin_api.dart' as _i22;
import '../apis/signin/signin_datasource.dart' as _i23;
import '../apis/signup/services/signup_api.dart' as _i25;
import '../apis/signup/signup_datasource.dart' as _i26;
import '../apis/upload_image/apis/upload_media.dart' as _i29;
import '../apis/upload_image/upload_file_datasource.dart' as _i43;
import '../core/dio_cache/dio_cache_manager.dart' as _i4;
import '../modules/%20exchange_points/exchange_point_detail/exchange_point_detail_model.dart'
    as _i37;
import '../modules/%20exchange_points/exchange_points_model.dart' as _i38;
import '../modules/cart/cart_model.dart' as _i45;
import '../modules/cart/widgets/cart_widget_model.dart' as _i46;
import '../modules/gift_exchange/lof_gift_exchange/app/list_product_model.dart'
    as _i39;
import '../modules/main_page_model.dart' as _i6;
import '../modules/modules_store/%20create_gift_order/create_gift_order_model.dart'
    as _i3;
import '../modules/modules_store/main_page_store_model.dart' as _i7;
import '../modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart'
    as _i10;
import '../modules/order_manager/detal_order_manager/app/detail_order_model.dart'
    as _i36;
import '../modules/order_manager/order_manager_model.dart' as _i40;
import '../modules/productwidget/product_widget_model.dart' as _i41;
import '../modules/profile/profiled_model.dart' as _i21;
import '../modules/profile/profiledetail/setting_model.dart' as _i47;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i5;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i42;
import '../modules/splashsreen/splashsreen_model.dart' as _i28;
import '../usecases/address_usecase.dart' as _i32;
import '../usecases/customer_usercase.dart' as _i35;
import '../usecases/forget_password_usercase.dart' as _i14;
import '../usecases/ipd/product_datasource.dart' as _i20;
import '../usecases/signin_usecase.dart' as _i24;
import '../usecases/signup_usecase.dart' as _i27;
import '../usecases/upload_file_usecase.dart' as _i44;
import 'injection_config.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.factory<_i3.CreateGiftOrderModel>(() => _i3.CreateGiftOrderModel());
  gh.lazySingleton<_i4.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i5.FormPassModel>(() => _i5.FormPassModel());
  gh.lazySingleton<_i6.MainPageModel>(() => _i6.MainPageModel());
  gh.lazySingleton<_i7.MainPageStoreModel>(() => _i7.MainPageStoreModel());
  gh.singleton<_i8.NumCartDetail>(_i8.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i8.NumCartPoint>(_i8.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  await gh.factoryAsync<_i9.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.factory<_i10.StatisticStoreModel>(() => _i10.StatisticStoreModel());
  gh.lazySingleton<_i11.Dio>(() => moduleRegister.getDio(
      get<_i9.SharedPreferences>(), get<_i4.DioCacheManager>()));
  gh.lazySingleton<_i12.ForgetPasswordAPI>(
      () => _i12.ForgetPasswordAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i13.ForgetPasswordDatasource>(
      () => _i13.ForgetPasswordDatasourceImpl(get<_i12.ForgetPasswordAPI>()));
  gh.lazySingleton<_i14.ForgetPasswordUsecase>(
      () => _i14.ForgetPasswordUsecase(get<_i13.ForgetPasswordDatasource>()));
  gh.lazySingleton<_i15.GiftExchangePlaceAPI>(
      () => _i15.GiftExchangePlaceAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i16.GiftExchangePlaceDatasource>(() =>
      _i16.GiftExchangePlaceDatasourceImpl(get<_i15.GiftExchangePlaceAPI>()));
  gh.factory<_i17.MyApp>(() => _i17.MyApp(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i18.ProductApi>(() => _i18.ProductApi(get<_i11.Dio>()));
  gh.lazySingleton<_i19.ProductDataSourceKun>(
      () => _i19.ProductDataSourceKunImpl(get<_i18.ProductApi>()));
  gh.lazySingleton<_i20.ProductUserCaseKun>(
      () => _i20.ProductUserCaseKun(get<_i19.ProductDataSourceKun>()));
  gh.factory<_i21.ProfiledModel>(
      () => _i21.ProfiledModel(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i22.SigninAPI>(() => _i22.SigninAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i23.SigninDatasource>(
      () => _i23.SigninDataSourceImpl(get<_i22.SigninAPI>()));
  gh.lazySingleton<_i24.SigninUsecase>(
      () => _i24.SigninUsecase(get<_i23.SigninDatasource>()));
  gh.lazySingleton<_i25.SignupAPI>(() => _i25.SignupAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i26.SignupDatasource>(
      () => _i26.SignupDataSourceImpl(get<_i25.SignupAPI>()));
  gh.lazySingleton<_i27.SignupUsecase>(
      () => _i27.SignupUsecase(get<_i26.SignupDatasource>()));
  gh.lazySingleton<_i28.SplashsreenModel>(() =>
      _i28.SplashsreenModel(get<_i9.SharedPreferences>(), get<_i11.Dio>()));
  gh.lazySingleton<_i29.UploadMedia>(() => _i29.UploadMedia(get<_i11.Dio>()));
  gh.lazySingleton<_i30.AddressAPI>(() => _i30.AddressAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i31.AddressDataSource>(
      () => _i31.AddressDataSourceImpl(get<_i30.AddressAPI>()));
  gh.lazySingleton<_i32.AddressUseCase>(
      () => _i32.AddressUseCase(get<_i31.AddressDataSource>()));
  gh.lazySingleton<_i33.CustomerAPI>(() => _i33.CustomerAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i34.CustomerDataSource>(
      () => _i34.CustomerDataSourceImpl(get<_i33.CustomerAPI>()));
  gh.lazySingleton<_i35.CustomerUserCase>(
      () => _i35.CustomerUserCase(get<_i34.CustomerDataSource>()));
  gh.factory<_i36.DetailOrderModel>(
      () => _i36.DetailOrderModel(get<_i35.CustomerUserCase>()));
  gh.factory<_i37.ExChangePointsDetailModel>(
      () => _i37.ExChangePointsDetailModel(get<_i35.CustomerUserCase>()));
  gh.factory<_i38.ExChangePointsModel>(() => _i38.ExChangePointsModel(
      get<_i35.CustomerUserCase>(), get<_i32.AddressUseCase>()));
  gh.factory<_i39.ListProductModel>(
      () => _i39.ListProductModel(get<_i19.ProductDataSourceKun>()));
  gh.factory<_i40.OrderManagerModel>(
      () => _i40.OrderManagerModel(get<_i35.CustomerUserCase>()));
  gh.factory<_i41.ProductWidgetModel>(() => _i41.ProductWidgetModel(
      get<_i35.CustomerUserCase>(), get<_i9.SharedPreferences>()));
  gh.factory<_i42.SigninModel>(() => _i42.SigninModel(
      get<_i24.SigninUsecase>(), get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i43.UploadFileDatasource>(
      () => _i43.UploadFileDatasourceImpl(get<_i29.UploadMedia>()));
  gh.lazySingleton<_i44.UploadFileUsecase>(
      () => _i44.UploadFileUsecase(get<_i43.UploadFileDatasource>()));
  gh.factory<_i45.CartModel>(() => _i45.CartModel(
      get<_i35.CustomerUserCase>(), get<_i9.SharedPreferences>()));
  gh.factory<_i46.CartWidgetModel>(() => _i46.CartWidgetModel(
      get<_i35.CustomerUserCase>(), get<_i45.CartModel>()));
  gh.factory<_i47.SettingProfileModel>(() => _i47.SettingProfileModel(
      get<_i9.SharedPreferences>(),
      get<_i44.UploadFileUsecase>(),
      get<_i35.CustomerUserCase>(),
      get<_i32.AddressUseCase>()));
  return get;
}

class _$ModuleRegister extends _i8.ModuleRegister {}
