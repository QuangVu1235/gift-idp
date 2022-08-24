import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/modules_store/order_manager/detail/detail_order_exchange.dart';
import 'package:idp_gift_app/src/modules/modules_store/order_manager/orders_exchange_model.dart';
import 'package:idp_gift_app/src/modules/order_manager/widget/order_widget.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';


class OrdersGiftExchange extends StatefulWidget {
  const OrdersGiftExchange({Key? key}) : super(key: key);

  @override
  State<OrdersGiftExchange> createState() => _OrdersGiftExchange();
}

class _OrdersGiftExchange extends ViewWidget<OrdersGiftExchange,OrdersGiftExchangeModel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Column(
       children: [
         Row(
           children: [
             Checkbox(
               value: true,
               onChanged: (value) {
                 setState(() {

                 });
               },
             ),
             Text(
               'Đổi quà Kun',
               style: TextStyle(
                   fontSize: 13.0,
                   color: UIColors.brandA
               ),
             ),
             Checkbox(

               value: true,
               onChanged: (value) {
                 setState(() {

                 });
               },
             ),
             Text(
               'Đổi quà LOF',
               style: TextStyle(
                   fontSize: 13.0,
                   color: UIColors.brandA
               ),
             ),

           ],
         ),
         Obx(()=> Expanded(
           child: Padding(
             padding: EdgeInsets.all(8.0),
             child: ListView(
               children: [
                 ListView.builder(
                   // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   //   crossAxisCount: 1,
                   //   childAspectRatio: 2,
                   //   mainAxisSpacing: 5,
                   //   crossAxisSpacing: 1
                   // ),
                   physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: viewModel.orders.length,
                   itemBuilder: (BuildContext context, int index) {
                     return  InkWell(
                       onTap: ()=>Get.to( DetailOrderExchangeScreen(orderResponse: viewModel.orders[index],)),
                       child: OrderWidget(
                         productID:  '#${viewModel.orders[index].code}',
                         type:'Kun',
                         status:viewModel.orders[index].status ?? '',
                         creator:viewModel.orders[index].customerName ?? '',
                         date_created: viewModel.orders[index].createdDate ?? '',
                         address:'Cửa hàng ${viewModel.orders[index].distributorName}',
                         image:viewModel.orders[index].details?.first.thumbnail ?? '',
                         quantity:viewModel.orders[index].details?.length.toString() ?? '0',

                       ),
                     );
                   },
                 ),
               ],
             ),
           ),
         ),)
       ],
        ),
    );

  }

  @override
  OrdersGiftExchangeModel createViewModel()=> getIt<OrdersGiftExchangeModel>();
}
