// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../main.dart' as _i15;
import '../apis/customer/customer_api.dart' as _i28;
import '../apis/datasoure/customer_datasoure.dart' as _i29;
import '../apis/forget_password/forget_password_datasource.dart' as _i13;
import '../apis/forget_password/services/forget_password_api.dart' as _i12;
import '../apis/idp/kun/product_datasource.dart' as _i17;
import '../apis/idp/kun/service/product_api.dart' as _i16;
import '../apis/signin/services/signin_api.dart' as _i20;
import '../apis/signin/signin_datasource.dart' as _i21;
import '../apis/signup/services/signup_api.dart' as _i23;
import '../apis/signup/signup_datasource.dart' as _i24;
import '../apis/upload_image/apis/upload_media.dart' as _i27;
import '../apis/upload_image/upload_file_datasource.dart' as _i34;
import '../core/dio_cache/dio_cache_manager.dart' as _i4;
import '../modules/cart/cart_model.dart' as _i36;
import '../modules/gift_exchange/lof_gift_exchange/app/list_product_model.dart'
    as _i31;
import '../modules/main_page_model.dart' as _i6;
import '../modules/modules_store/%20create_gift_order/create_gift_order_model.dart'
    as _i3;
import '../modules/modules_store/main_page_store_model.dart' as _i7;
import '../modules/modules_store/profile_store/statistic_store/model/statistic_store_model.dart'
    as _i10;
import '../modules/productwidget/product_widget_model.dart' as _i32;
import '../modules/profile/profiled_model.dart' as _i19;
import '../modules/signin_signup/app/form_pass/form_pass_model.dart' as _i5;
import '../modules/signin_signup/app/signin/app/signin_model.dart' as _i33;
import '../modules/splashsreen/splashsreen_model.dart' as _i26;
import '../usecases/customer_usercase.dart' as _i30;
import '../usecases/forget_password_usercase.dart' as _i14;
import '../usecases/ipd/product_datasource.dart' as _i18;
import '../usecases/signin_usecase.dart' as _i22;
import '../usecases/signup_usecase.dart' as _i25;
import '../usecases/upload_file_usecase.dart' as _i35;
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
  gh.factory<_i15.MyApp>(() => _i15.MyApp(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i16.ProductApi>(() => _i16.ProductApi(get<_i11.Dio>()));
  gh.lazySingleton<_i17.ProductDataSourceKun>(
      () => _i17.ProductDataSourceKunImpl(get<_i16.ProductApi>()));
  gh.lazySingleton<_i18.ProductUserCaseKun>(
      () => _i18.ProductUserCaseKun(get<_i17.ProductDataSourceKun>()));
  gh.factory<_i19.ProfiledModel>(
      () => _i19.ProfiledModel(get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i20.SigninAPI>(() => _i20.SigninAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i21.SigninDatasource>(
      () => _i21.SigninDataSourceImpl(get<_i20.SigninAPI>()));
  gh.lazySingleton<_i22.SigninUsecase>(
      () => _i22.SigninUsecase(get<_i21.SigninDatasource>()));
  gh.lazySingleton<_i23.SignupAPI>(() => _i23.SignupAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i24.SignupDatasource>(
      () => _i24.SignupDataSourceImpl(get<_i23.SignupAPI>()));
  gh.lazySingleton<_i25.SignupUsecase>(
      () => _i25.SignupUsecase(get<_i24.SignupDatasource>()));
  gh.lazySingleton<_i26.SplashsreenModel>(() =>
      _i26.SplashsreenModel(get<_i9.SharedPreferences>(), get<_i11.Dio>()));
  gh.lazySingleton<_i27.UploadMedia>(() => _i27.UploadMedia(get<_i11.Dio>()));
  gh.lazySingleton<_i28.CustomerAPI>(() => _i28.CustomerAPI(get<_i11.Dio>()));
  gh.lazySingleton<_i29.CustomerDataSource>(
      () => _i29.CustomerDataSourceImpl(get<_i28.CustomerAPI>()));
  gh.lazySingleton<_i30.CustomerUserCase>(
      () => _i30.CustomerUserCase(get<_i29.CustomerDataSource>()));
  gh.factory<_i31.ListProductModel>(
      () => _i31.ListProductModel(get<_i17.ProductDataSourceKun>()));
  gh.factory<_i32.ProductWidgetModel>(
      () => _i32.ProductWidgetModel(get<_i30.CustomerUserCase>()));
  gh.factory<_i33.SigninModel>(() => _i33.SigninModel(
      get<_i22.SigninUsecase>(), get<_i9.SharedPreferences>()));
  gh.lazySingleton<_i34.UploadFileDatasource>(
      () => _i34.UploadFileDatasourceImpl(get<_i27.UploadMedia>()));
  gh.lazySingleton<_i35.UploadFileUsecase>(
      () => _i35.UploadFileUsecase(get<_i34.UploadFileDatasource>()));
  gh.factory<_i36.CartModel>(
      () => _i36.CartModel(get<_i30.CustomerUserCase>()));
  return get;
}

class _$ModuleRegister extends _i8.ModuleRegister {}
