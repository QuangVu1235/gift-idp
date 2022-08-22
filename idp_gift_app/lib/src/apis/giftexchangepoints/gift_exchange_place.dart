import 'package:dio/dio.dart';
import 'package:idp_gift_app/src/apis/response/order_resp.dart';
import 'package:idp_gift_app/src/config/base_api.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'gift_exchange_place.g.dart';

@RestApi(baseUrl: BaseApi.idpRoot)
@LazySingleton()
abstract class GiftExchangePlaceAPI {
  @factoryMethod
  factory GiftExchangePlaceAPI(Dio dio) = _GiftExchangePlaceAPI;

  //add to cart
  // {
  // "product_id": 3001,
  // "options": [],
  // "session_id": "eyJpdiI6Ik9Xc25vaEdDMkF6VjcrMWZvcHRqeVE9PSIsInZhbHVlIjoicUpsUVNVc3lseFg3dkpOaXNwS1ZCUmVGLzVUbDBnUnQ3dGZVMTRubE5DWT0iLCJtYWMiOiI3OTA0YmU4ZTNjZWNhZGUxNjg2MDI5ZDk2YjVlMmVjZjdjZTZlYjNmNGYwYThkOTdlY2FlNDNjODc3MzQ4ZDY4IiwidGFnIjoiIn0="
  // }

  //addToCart
  @POST('v1/client/add-to-cart-exchange')
  Future<dynamic> addToCartGiftExchange(@Body() dynamic body);

  //duyệt đơn hàng, cập nhập đơn quà
  @PUT('v1/orders-exchange/{id}/status')
  Future<dynamic> changeStatusOrder(@Path('id') String id, @Body() Map<String, dynamic> body);

  // hoàn thành đơn hàng
  @PUT('v1/complete-order-exchange')
  Future<dynamic> doPutComplete(@Query('order_code') String orderCode);

  // Lấy danh sách đơn hàng
  @GET('v1/orders-exchange-of-gift-exchange')
  Future<DataOrderResponse> doGetAllOrdersOfCustomer();

  // thêm thẻ đổi quà
  // {
  //     "code": "CC02",
  //     "name": "Thẻ Môi Trường",
  //     "from": "",
  //     "expired": "",
  //     "type": "COLLECTION",
  //     "cards_release": 50,
  //     "cards_recall" : 0
  // }
  @POST('v1/cards')
  Future<dynamic> doPostCreateCard(@Body() dynamic body);

  //thiết lập chương trình đổi quà
  // {
  //     "card_id": "3",
  //     "card_code": "CC02",
  //     "product_id": "3002",
  //     "product_code": "901000009",
  //     "quantity": 4
  // }
  @POST('v1/cards-condition')
  Future<dynamic> doPostCreateCondition(@Body() dynamic body);

  //add to cart
  // {
  // "product_id": 3001,
  // "options": [],
  // "session_id": "eyJpdiI6Ik9Xc25vaEdDMkF6VjcrMWZvcHRqeVE9PSIsInZhbHVlIjoicUpsUVNVc3lseFg3dkpOaXNwS1ZCUmVGLzVUbDBnUnQ3dGZVMTRubE5DWT0iLCJtYWMiOiI3OTA0YmU4ZTNjZWNhZGUxNjg2MDI5ZDk2YjVlMmVjZjdjZTZlYjNmNGYwYThkOTdlY2FlNDNjODc3MzQ4ZDY4IiwidGFnIjoiIn0="
  // }

  // {
  // "session_id": "eyJpdiI6ImZaRDk5N2ZkZk1kUU5kaDZRTm42dUE9PSIsInZhbHVlIjoiLzc2N2FYZHNUNGZVSERpeVZkZlllcnZUVEVwVThBcHQyczd6QzJtVzA2MD0iLCJtYWMiOiIzMmI1ZGZhYjMwMTUzNTcwYzBhN2YzZjI1YjYyZDdkZTg2NWUzZDk5ZjIwNzUyZjQ4ZjcwODEwNmMxYWE3YjIwIiwidGFnIjoiIn0=",
  // "phone": "0909010119",
  // "city_code": "79",
  // "district_code": "771",
  // "ward_code": "27202",
  // "city_name": "Thành phố Hồ Chí Minh",
  // "district_name": "Quận 10",
  // "ward_name": "Phường 6",
  // "street_address": "xxx",
  // "order_channel": "WEB",
  // "distributor_id": 4,
  // "distributor_code": "quan.pham",
  // "distributor_name": "Quân Phạm"
  // }

  //confirm order
  @POST('v1/gift-place-confirm-order-exchange')
  Future<dynamic> confirmOrderByGiftExchange(@Body() dynamic body);

  //Thêm sp vào đơn tạm ứng
  @POST('v1/client/add-to-cart')
  Future<dynamic> addToCartAdvance(@Body() dynamic body);





}
