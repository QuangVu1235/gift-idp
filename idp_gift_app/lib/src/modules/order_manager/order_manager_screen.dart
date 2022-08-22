import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/config/injection_config.dart';
import 'package:idp_gift_app/src/modules/order_manager/order_manager_model.dart';
import 'package:idp_gift_app/src/modules/order_manager/widget/order_widget.dart';
import 'package:idp_gift_app/src/utils/widgets/view_widget.dart';
import '../../themes/ui_colors.dart';
import 'detal_order_manager/app/detail_order_screen.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ViewWidget<OrderScreen,OrderManagerModel> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Column(
       children: [
         // Row(
         //   children: [
         //     Expanded(
         //       flex: 1,
         //       child: CheckboxListTile(
         //           title: const Text('Đơn quà Kun',
         //             style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w400),),
         //           tileColor: Colors.white,
         //           controlAffinity: ListTileControlAffinity.leading,
         //           contentPadding: EdgeInsets.zero,
         //           activeColor: UIColors.white,
         //           value: _isChecked,
         //           checkColor: UIColors.brandA,
         //           onChanged: (bool? newValue){
         //             setState(() {
         //               _isChecked = newValue;
         //             });
         //           }
         //       ),
         //     ),
         //     Expanded(
         //       flex: 1,
         //       child: CheckboxListTile(
         //           title: const Text('Đơn quà LOF',
         //             style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w400),),
         //           tileColor: Colors.white,
         //           controlAffinity: ListTileControlAffinity.leading,
         //           contentPadding: EdgeInsets.zero,
         //           activeColor: UIColors.white,
         //           value: _isChecked,
         //           checkColor: UIColors.brandA,
         //           onChanged: (bool? newValue){
         //             setState(() {
         //               _isChecked = newValue;
         //             });
         //           }
         //       ),
         //     ),
         //
         //   ],
         // ),
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
                       onTap: ()=>Get.to(DetailOrderScreen(orderResponse: viewModel.orders[index],)),
                       child: OrderWidget(
                         productID:  '#${viewModel.orders[index].code}',
                         type:'Kun',
                         status:viewModel.orders[index].details?.first?.statusName ?? '',
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
  OrderManagerModel createViewModel()=> getIt<OrderManagerModel>();
}
