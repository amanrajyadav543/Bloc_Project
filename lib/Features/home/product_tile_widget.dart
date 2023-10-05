
import 'dart:html';

import 'package:bloc_project/Features/home/home_Bloc.dart';
import 'package:bloc_project/Features/home/home_bloc.dart';
import 'package:bloc_project/Features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class ProductTileWeidget extends StatelessWidget{
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWeidget({ super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build (BuildContext context){
    return Container(
      margin: const EdgeInsets.all(10),
      padding:  const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
Container(
  height: 200,
  width: double.maxFinite,
  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,
   image: NetworkImage(productDataModel.imageUrl))),
),
const SizedBox(height: 20,),
  Text(productDataModel.name,
  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
  Text(productDataModel.description),
   const SizedBox(height: 20,),
   Row(
    mainAxisAlignment:  MainAxisAlignment.spaceBetween,
    children: [
      Text("\$"+ productDataModel.price.toString(),
      style: TextStyle(fontSize: 18, fontWeight:  FontWeight.bold),),
      Row(
        children: [
          IconButton(onPressed: (){
            homeBloc.add(HomeProductWishlistButtonClickEvent(
              clickedProduct: productDataModel
            ));
          }, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: (){
            homeBloc.add(HomeProductcartButtonClickEvent(
              clickedProduct: productDataModel
            ));
          }, icon: Icon(Icons.shopping_basket_outlined)),
        ],
      )
    ],
   )
      ]),
    );
  }
}