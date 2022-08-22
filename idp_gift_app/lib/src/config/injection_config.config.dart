// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../main.dart' as _i16;
import '../apis/address/address_api.dart' as _i29;
import '../apis/address/address_datasource.dart' as _i30;
import '../apis/customer/customer_api.dart' as _i32;
import '../apis/customer/customer_datasoure.dart' as _i33;
import '../apis/forget_password/forget_password_datasource.dart' as _i13;
import '../apis/forget_password/services/forget_password_api.dart' as _i12;
import '../apis/giftexchangepoints/gift_exchange_place.dart' as _i15;
import '../apis/giftexchangepoints/gift_exchange_place_datasource.dart' as _i38;
import '../apis/idp/kun/product_datasource.dart' as _i18;
import '../apis/idp/kun/service/product_api.dart' as _i17;
import '../apis/signin/services/signin_api.dart' as _i21;
import '../apis/signin/signin_datasource.dart' as _i22;
import '../apis/signup/services/signup_api.dart' as _i24;
import '../apis/signup/signup_datasource.dart' as _i25;
import '../apis/upload_image/apis/upload_media.dart' as _i28;
import '../apis/upload_image/upload_file_datasource.dart' as _i45;
import '../core/dio_cache/dio_cache_manager.dart' as _i4;
import '../modules/%20exchange_points/exchange_point_detail/exchange_point_detail_model.dart'
    as _i36;
import '../modules/%20exchange_points/exchange_points_model.dart' as _i37;
import '../modules/cart/cart_model.dart' as _i49;
import '../modules/cart/widgets/cart_widget_model.dart' as _i50;
import '../modules/gift_exchange/lof_gift_exchange/app/list_product_model.dart'
    as _i40;
import '../modules/main_page_model.dart' as _i6;
import '../modules/modules_store/%20create_gift_order/create_gift_order_model.dart'
    as _i3;
import '../modules/modules_store/main_page_store_model.dart' as _i7;
import '../modules/modules_store/order_manager/detail/detail_order_exchange_model.dart'
    as _i51;
import '../modules/modules_store/order_manager/orders_exchange_model.dart'
    as _i42;
import '../modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart'
    as _i10;
import '../modules/order_manager/detal_order_manager/app/detail_order_model.dart'
    as _i35;
import '../modules/order_manager/order_manager_model.dart' as _i41;
import '../modules/productwidget/product_widget_model.dart' as _i43;
import '../modules/profile/add_address/add_address_model.dart' as _i47;
import '../modules/profile/addressbook/address_model.dart' as _i48;
import '../modules/profile/profiled_model.dart' as _i20;
import '../modules/profile/profiledetail/setting_model.dart' as _i52;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i5;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i44;
import '../modules/splashsreen/splashsreen_model.dart' as _i27;
import '../usecases/address_usecase.dart' as _i31;
import '../usecases/customer_usercase.dart' as _i34;
import '../usecases/forget_password_usercase.dart' as _i14;
import '../usecases/gift_exchange_usecase.dart' as _i39;
import '../usecases/ipd/product_datasource.dart' as _i19;
import '../usecases/signin_usecase.dart' as _i23;
import '../usecases/signup_usecase.dart' as _i26;
import '../usecases/upload_file_usecase.dart' as _i46;
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
  gh.factory<_i16.MyApp>(() => _i16.MyApp(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i17.ProductApi>(() => _i17.ProductApi(get<_i11.Dio>()));
  gh.lazySingleton<_i18.ProductDataSourceKun>(
      () => _i18.ProductDataSourceKunImpl(get<_i17.ProductApi>()));
  gh.lazySingleton<_i19.ProductUserCaseKun>(
      () => _i19.ProductUserCaseKun(get<_i18.ProductDataSourceKun>()));
  gh.factory<_i20.ProfiledModel>(
      () => _i20.ProfiledModel(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i21.SigninAPI>(() => _i21.SigninAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i22.SigninDatasource>(
      () => _i22.SigninDataSourceImpl(get<_i21.SigninAPI>()));
  gh.lazySingleton<_i23.SigninUsecase>(
      () => _i23.SigninUsecase(get<_i22.SigninDatasource>()));
  gh.lazySingleton<_i24.SignupAPI>(() => _i24.SignupAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i25.SignupDatasource>(
      () => _i25.SignupDataSourceImpl(get<_i24.SignupAPI>()));
  gh.lazySingleton<_i26.SignupUsecase>(
      () => _i26.SignupUsecase(get<_i25.SignupDatasource>()));
  gh.lazySingleton<_i27.SplashsreenModel>(() =>
      _i27.SplashsreenModel(get<_i9.SharedPreferences>(), get<_i11.Dio>()));
  gh.lazySingleton<_i28.UploadMedia>(() => _i28.UploadMedia(get<_i11.Dio>()));
  gh.lazySingleton<_i29.AddressAPI>(() => _i29.AddressAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i30.AddressDataSource>(
      () => _i30.AddressDataSourceImpl(get<_i29.AddressAPI>()));
  gh.lazySingleton<_i31.AddressUseCase>(
      () => _i31.AddressUseCase(get<_i30.AddressDataSource>()));
  gh.lazySingleton<_i32.CustomerAPI>(() => _i32.CustomerAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i33.CustomerDataSource>(
      () => _i33.CustomerDataSourceImpl(get<_i32.CustomerAPI>()));
  gh.lazySingleton<_i34.CustomerUserCase>(
      () => _i34.CustomerUserCase(get<_i33.CustomerDataSource>()));
  gh.factory<_i35.DetailOrderModel>(
      () => _i35.DetailOrderModel(get<_i34.CustomerUserCase>()));
  gh.factory<_i36.ExChangePointsDetailModel>(
      () => _i36.ExChangePointsDetailModel(get<_i34.CustomerUserCase>()));
  gh.factory<_i37.ExChangePointsModel>(() => _i37.ExChangePointsModel(
      get<_i34.CustomerUserCase>(), get<_i31.AddressUseCase>()));
  gh.lazySingleton<_i38.GiftExchangeDatasource>(() =>
      _i38.GiftExchangePlaceDatasourceImpl(get<_i15.GiftExchangePlaceAPI>()));
  gh.lazySingleton<_i39.GiftExchangeUseCase>(
      () => _i39.GiftExchangeUseCase(get<_i38.GiftExchangeDatasource>()));
  gh.factory<_i40.ListProductModel>(
      () => _i40.ListProductModel(get<_i18.ProductDataSourceKun>()));
  gh.factory<_i41.OrderManagerModel>(
      () => _i41.OrderManagerModel(get<_i34.CustomerUserCase>()));
  gh.factory<_i42.OrdersGiftExchangeModel>(() => _i42.OrdersGiftExchangeModel(
      get<_i34.CustomerUserCase>(), get<_i39.GiftExchangeUseCase>()));
  gh.factory<_i43.ProductWidgetModel>(() => _i43.ProductWidgetModel(
      get<_i34.CustomerUserCase>(), get<_i9.SharedPreferences>()));
  gh.factory<_i44.SigninModel>(() => _i44.SigninModel(
      get<_i23.SigninUsecase>(), get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i45.UploadFileDatasource>(
      () => _i45.UploadFileDatasourceImpl(get<_i28.UploadMedia>()));
  gh.lazySingleton<_i46.UploadFileUsecase>(
      () => _i46.UploadFileUsecase(get<_i45.UploadFileDatasource>()));
  gh.factory<_i47.AddAddressModel>(() => _i47.AddAddressModel(
      get<_i34.CustomerUserCase>(), get<_i31.AddressUseCase>()));
  gh.factory<_i48.AddressModel>(
      () => _i48.AddressModel(get<_i34.CustomerUserCase>()));
  gh.factory<_i49.CartModel>(() => _i49.CartModel(
      get<_i34.CustomerUserCase>(), get<_i9.SharedPreferences>()));
  gh.factory<_i50.CartWidgetModel>(() => _i50.CartWidgetModel(
      get<_i34.CustomerUserCase>(), get<_i49.CartModel>()));
  gh.factory<_i51.DetailOrderExchangeModel>(() => _i51.DetailOrderExchangeModel(
      get<_i34.CustomerUserCase>(), get<_i39.GiftExchangeUseCase>()));
  gh.factory<_i52.SettingProfileModel>(() => _i52.SettingProfileModel(
      get<_i9.SharedPreferences>(),
      get<_i46.UploadFileUsecase>(),
      get<_i34.CustomerUserCase>(),
      get<_i31.AddressUseCase>()));
  return get;
}

class _$ModuleRegister extends _i8.ModuleRegister {}
