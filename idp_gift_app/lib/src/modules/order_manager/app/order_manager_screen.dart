import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/config/assets/image_asset.dart';
import 'package:idp_gift_app/src/modules/order_manager/app/order_widget.dart';

import '../../../themes/ui_colors.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
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
         Expanded(
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
                   itemCount: 8,
                   itemBuilder: (BuildContext context, int index) {
                     return  OrderWidget(
                       productID: '#12345',
                       type:'Kun',
                       status:'Chờ xác nhận',
                       creator:'Khách hàng onlline',
                       date_created:'10:30 - 28/05/2022',
                       address:'Cửa hàng Thị Huệ',
                       image:ImageAssets.imggiftproduct,
                       quantity:'2',

                     );
                   },
                 ),
               ],
             ),
           ),
         ),

       ],
        ),
    );

  }
}
