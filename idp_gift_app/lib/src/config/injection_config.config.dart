// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../main.dart' as _i15;
import '../apis/address/address_api.dart' as _i28;
import '../apis/address/address_datasource.dart' as _i29;
import '../apis/customer/customer_api.dart' as _i31;
import '../apis/customer/customer_datasoure.dart' as _i32;
import '../apis/forget_password/forget_password_datasource.dart' as _i12;
import '../apis/forget_password/services/forget_password_api.dart' as _i11;
import '../apis/giftexchangepoints/gift_exchange_place.dart' as _i14;
import '../apis/giftexchangepoints/gift_exchange_place_datasource.dart' as _i37;
import '../apis/idp/kun/product_datasource.dart' as _i17;
import '../apis/idp/kun/service/product_api.dart' as _i16;
import '../apis/signin/services/signin_api.dart' as _i20;
import '../apis/signin/signin_datasource.dart' as _i21;
import '../apis/signup/services/signup_api.dart' as _i23;
import '../apis/signup/signup_datasource.dart' as _i24;
import '../apis/upload_image/apis/upload_media.dart' as _i27;
import '../apis/upload_image/upload_file_datasource.dart' as _i44;
import '../core/dio_cache/dio_cache_manager.dart' as _i3;
import '../modules/%20exchange_points/exchange_point_detail/exchange_point_detail_model.dart'
    as _i35;
import '../modules/%20exchange_points/exchange_points_model.dart' as _i36;
import '../modules/cart/cart_model.dart' as _i49;
import '../modules/cart/widgets/cart_widget_model.dart' as _i50;
import '../modules/gift_exchange/lof_gift_exchange/app/list_product_model.dart'
    as _i39;
import '../modules/main_page_model.dart' as _i5;
import '../modules/modules_store/cart_gift_exchange/cart_gift_exchange_model.dart'
    as _i48;
import '../modules/modules_store/main_page_store_model.dart' as _i6;
import '../modules/modules_store/order_manager/detail/detail_order_exchange_model.dart'
    as _i52;
import '../modules/modules_store/order_manager/orders_exchange_model.dart'
    as _i41;
import '../modules/modules_store/products_gift_exchange/products_gift_exchange_model.dart'
    as _i51;
import '../modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart'
    as _i9;
import '../modules/order_manager/detal_order_manager/app/detail_order_model.dart'
    as _i34;
import '../modules/order_manager/order_manager_model.dart' as _i40;
import '../modules/productwidget/product_widget_model.dart' as _i42;
import '../modules/profile/add_address/add_address_model.dart' as _i46;
import '../modules/profile/addressbook/address_model.dart' as _i47;
import '../modules/profile/profiled_model.dart' as _i19;
import '../modules/profile/profiledetail/setting_model.dart' as _i53;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i4;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i43;
import '../modules/splashsreen/splashsreen_model.dart' as _i26;
import '../usecases/address_usecase.dart' as _i30;
import '../usecases/customer_usercase.dart' as _i33;
import '../usecases/forget_password_usercase.dart' as _i13;
import '../usecases/gift_exchange_usecase.dart' as _i38;
import '../usecases/ipd/product_datasource.dart' as _i18;
import '../usecases/signin_usecase.dart' as _i22;
import '../usecases/signup_usecase.dart' as _i25;
import '../usecases/upload_file_usecase.dart' as _i45;
import 'injection_config.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleRegister = _$ModuleRegister();
  gh.lazySingleton<_i3.DioCacheManager>(() => moduleRegister.getDioCache());
  gh.factory<_i4.FormPassModel>(() => _i4.FormPassModel());
  gh.lazySingleton<_i5.MainPageModel>(() => _i5.MainPageModel());
  gh.lazySingleton<_i6.MainPageStoreModel>(() => _i6.MainPageStoreModel());
  gh.singleton<_i7.NumCartDetail>(_i7.NumCartDetail(),
      dispose: (i) => i.disposeCartNumberStream());
  gh.singleton<_i7.NumCartPoint>(_i7.NumCartPoint(),
      dispose: (i) => i.disposeCartNumberStream());
  await gh.factoryAsync<_i8.SharedPreferences>(
      () => moduleRegister.sharedPreferences(),
      preResolve: true);
  gh.factory<_i9.StatisticStoreModel>(() => _i9.StatisticStoreModel());
  gh.lazySingleton<_i10.Dio>(() => moduleRegister.getDio(
      get<_i8.SharedPreferences>(), get<_i3.DioCacheManager>()));
  gh.lazySingleton<_i11.ForgetPasswordAPI>(
      () => _i11.ForgetPasswordAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i12.ForgetPasswordDatasource>(
      () => _i12.ForgetPasswordDatasourceImpl(get<_i11.ForgetPasswordAPI>()));
  gh.lazySingleton<_i13.ForgetPasswordUsecase>(
      () => _i13.ForgetPasswordUsecase(get<_i12.ForgetPasswordDatasource>()));
  gh.lazySingleton<_i14.GiftExchangePlaceAPI>(
      () => _i14.GiftExchangePlaceAPI(get<_i10.Dio>()));
  gh.factory<_i15.MyApp>(() => _i15.MyApp(get<_i8.SharedPreferences>()));
  gh.lazySingleton<_i16.ProductApi>(() => _i16.ProductApi(get<_i10.Dio>()));
  gh.lazySingleton<_i17.ProductDataSourceKun>(
      () => _i17.ProductDataSourceKunImpl(get<_i16.ProductApi>()));
  gh.lazySingleton<_i18.ProductUserCaseKun>(
      () => _i18.ProductUserCaseKun(get<_i17.ProductDataSourceKun>()));
  gh.factory<_i19.ProfiledModel>(
      () => _i19.ProfiledModel(get<_i8.SharedPreferences>()));
  gh.lazySingleton<_i20.SigninAPI>(() => _i20.SigninAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i21.SigninDatasource>(
      () => _i21.SigninDataSourceImpl(get<_i20.SigninAPI>()));
  gh.lazySingleton<_i22.SigninUsecase>(
      () => _i22.SigninUsecase(get<_i21.SigninDatasource>()));
  gh.lazySingleton<_i23.SignupAPI>(() => _i23.SignupAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i24.SignupDatasource>(
      () => _i24.SignupDataSourceImpl(get<_i23.SignupAPI>()));
  gh.lazySingleton<_i25.SignupUsecase>(
      () => _i25.SignupUsecase(get<_i24.SignupDatasource>()));
  gh.lazySingleton<_i26.SplashsreenModel>(() =>
      _i26.SplashsreenModel(get<_i8.SharedPreferences>(), get<_i10.Dio>()));
  gh.lazySingleton<_i27.UploadMedia>(() => _i27.UploadMedia(get<_i10.Dio>()));
  gh.lazySingleton<_i28.AddressAPI>(() => _i28.AddressAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i29.AddressDataSource>(
      () => _i29.AddressDataSourceImpl(get<_i28.AddressAPI>()));
  gh.lazySingleton<_i30.AddressUseCase>(
      () => _i30.AddressUseCase(get<_i29.AddressDataSource>()));
  gh.lazySingleton<_i31.CustomerAPI>(() => _i31.CustomerAPI(get<_i10.Dio>()));
  gh.lazySingleton<_i32.CustomerDataSource>(
      () => _i32.CustomerDataSourceImpl(get<_i31.CustomerAPI>()));
  gh.lazySingleton<_i33.CustomerUserCase>(
      () => _i33.CustomerUserCase(get<_i32.CustomerDataSource>()));
  gh.factory<_i34.DetailOrderModel>(
      () => _i34.DetailOrderModel(get<_i33.CustomerUserCase>()));
  gh.factory<_i35.ExChangePointsDetailModel>(
      () => _i35.ExChangePointsDetailModel(get<_i33.CustomerUserCase>()));
  gh.factory<_i36.ExChangePointsModel>(() => _i36.ExChangePointsModel(
      get<_i33.CustomerUserCase>(), get<_i30.AddressUseCase>()));
  gh.lazySingleton<_i37.GiftExchangeDatasource>(() =>
      _i37.GiftExchangePlaceDatasourceImpl(get<_i14.GiftExchangePlaceAPI>()));
  gh.lazySingleton<_i38.GiftExchangeUseCase>(
      () => _i38.GiftExchangeUseCase(get<_i37.GiftExchangeDatasource>()));
  gh.factory<_i39.ListProductModel>(
      () => _i39.ListProductModel(get<_i17.ProductDataSourceKun>()));
  gh.factory<_i40.OrderManagerModel>(
      () => _i40.OrderManagerModel(get<_i33.CustomerUserCase>()));
  gh.factory<_i41.OrdersGiftExchangeModel>(() => _i41.OrdersGiftExchangeModel(
      get<_i33.CustomerUserCase>(), get<_i38.GiftExchangeUseCase>()));
  gh.factory<_i42.ProductWidgetModel>(() => _i42.ProductWidgetModel(
      get<_i33.CustomerUserCase>(), get<_i8.SharedPreferences>()));
  gh.factory<_i43.SigninModel>(() => _i43.SigninModel(
      get<_i22.SigninUsecase>(), get<_i8.SharedPreferences>()));
  gh.lazySingleton<_i44.UploadFileDatasource>(
      () => _i44.UploadFileDatasourceImpl(get<_i27.UploadMedia>()));
  gh.lazySingleton<_i45.UploadFileUsecase>(
      () => _i45.UploadFileUsecase(get<_i44.UploadFileDatasource>()));
  gh.factory<_i46.AddAddressModel>(() => _i46.AddAddressModel(
      get<_i33.CustomerUserCase>(), get<_i30.AddressUseCase>()));
  gh.factory<_i47.AddressModel>(
      () => _i47.AddressModel(get<_i33.CustomerUserCase>()));
  gh.factory<_i48.CartGiftExchangeModel>(() => _i48.CartGiftExchangeModel(
      get<_i33.CustomerUserCase>(),
      get<_i8.SharedPreferences>(),
      get<_i38.GiftExchangeUseCase>()));
  gh.factory<_i49.CartModel>(() => _i49.CartModel(get<_i33.CustomerUserCase>(),
      get<_i8.SharedPreferences>(), get<_i38.GiftExchangeUseCase>()));
  gh.factory<_i50.CartWidgetModel>(() => _i50.CartWidgetModel(
      get<_i33.CustomerUserCase>(), get<_i49.CartModel>()));
  gh.factory<_i51.CreateGiftOrderModel>(() => _i51.CreateGiftOrderModel(
      get<_i38.GiftExchangeUseCase>(), get<_i8.SharedPreferences>()));
  gh.factory<_i52.DetailOrderExchangeModel>(() => _i52.DetailOrderExchangeModel(
      get<_i33.CustomerUserCase>(),
      get<_i38.GiftExchangeUseCase>(),
      get<_i41.OrdersGiftExchangeModel>()));
  gh.factory<_i53.SettingProfileModel>(() => _i53.SettingProfileModel(
      get<_i8.SharedPreferences>(),
      get<_i45.UploadFileUsecase>(),
      get<_i33.CustomerUserCase>(),
      get<_i30.AddressUseCase>()));
  return get;
}

class _$ModuleRegister extends _i7.ModuleRegister {}
