import 'dart:ffi';

import 'package:bloc_project/Features/home/home_Bloc.dart';
import 'package:bloc_project/Features/home/home_bloc.dart';
import 'package:bloc_project/Features/home/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home>createState()=>_HomeState();
}

class _HomeState extends State<Home>{

  @override
   Void initState(){
    HomeBloc.add(HomeInitial());
    super.initState();
   }

   final HomeBloc homeBloc = HomeBloc();

   @override
   Widget build(BuildContext context){
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current)=>current is HomeActionState,
        buildWhen:(previous, current)=> current is! HomeActionState ,
        listener: (context,State){
          if(state is HomeNavigationToCartPageActionState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
          }
          else if(state is HomeNavigationToWishlistPageAction){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Wishlist()));
          }
          else if(State is HomeProductItemCartedActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Carted')));
          }
          else if(state is HomeProductItemWishlistedActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Item Wishlisted")));
          }

        },
        builder: (context, state){
          switch(state.runtimeType){
            case HomeLoadingState:
             return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              )
             );
             case HomeLoadedSuccessState:
             final successState = state as HomeLoadedSuccessState;
             return Scaffold(
              appBar:  AppBar(backgroundColor: Colors.teal,
              title: Text('Grocery Store'),
              actions: [
                IconButton(onPressed: (){
                  homeBloc.add(HomeWishlistButtonNavigationEvent());
                }, icon: Icon(Icons.favorite_border)),
                IconButton(onPressed: (){
                  homeBloc.add(HomeCartButtonNavigationEvent());
                }, icon: Icon(Icons.shopping_bag_outlined)),
              ],
              ),
              body: ListView.builder(itemCount: scuccessState.product.length,
              itemBuilder: (context, index){
                return ProductTileWeidget(productDataModel: successState.product[index], homeBloc: homeBloc);
              },),
             );
              case HomeErrorState:
              return Scaffold(body: Center(child: Text('Error')),);
              default:
              return SizedBox();
          }
        },

    );
   }
}