import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class OrderManagerScreen extends StatefulWidget {
  const OrderManagerScreen({Key? key}) : super(key: key);

  @override
  State<OrderManagerScreen> createState() => _OrderManagerScreenState();
}

class _OrderManagerScreenState extends State<OrderManagerScreen> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child:   Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CheckboxListTile(
                            title: const Text('Đơn quà Kun',
                              style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w400),),
                            tileColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            // visualDensity: const VisualDensity(
                            //     vertical: -4,
                            //     horizontal: -4
                            // ),
                            activeColor: Colors.blue,
                            value: _isChecked,
                            checkColor: Colors.blue,
                            onChanged: (bool? newValue){
                              setState(() {
                                _isChecked = newValue;
                              });
                            }
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: CheckboxListTile(
                            title: const Text('Đơn quà LOF',
                              style: TextStyle(color: Colors.blue,fontSize: 13,fontWeight: FontWeight.w400),),
                            tileColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            // visualDensity: const VisualDensity(
                            //     vertical: -4,
                            //     horizontal: -4
                            // ),
                            activeColor: Colors.blue,
                            value: _isChecked,
                            checkColor: Colors.blue,
                            onChanged: (bool? newValue){
                              setState(() {
                                _isChecked = newValue;
                              });
                            }
                        ),
                      ),

                    ],
                  ),)
            ],
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: OrderCard(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
