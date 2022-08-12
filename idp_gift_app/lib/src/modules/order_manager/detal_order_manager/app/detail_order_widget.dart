import 'dart:core';


import 'package:flutter/material.dart';
import 'package:idp_gift_app/src/themes/space_values.dart';
import 'package:idp_gift_app/src/themes/ui_colors.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({Key? key,
    required this.image ,
    required this.productID,
    required this.name,
    required this.quantity,
    required this.size,
    required this.color,
    required this.price,}) : super(key: key);
  final String image;
  final String productID;
  final String name;
  final String quantity;
  final String size;
  final String color;
  final String price;
  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Card(
          elevation: 0.0,
          margin: EdgeInsets.zero,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5,right: 10),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width *0.3,
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: Image.asset(widget.image))),
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8,top: 10,bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.productID,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                        Text(widget.name,style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
                        SizedBox(height: SpaceValues.space4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Số lượng:'),
                            Text(widget.quantity,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)
                          ],
                        ),
                        SizedBox(height: SpaceValues.space4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Size:'),
                            Text(widget.size,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: SpaceValues.space4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Màu sắc:'),
                            Text(widget.color,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: SpaceValues.space4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tổng thẻ quà Kun:'),
                            Text(widget.price,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700,color: UIColors.red),),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        )
    );
  }
}
