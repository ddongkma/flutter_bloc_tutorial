
import 'package:counter_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {

  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  const ProductTileWidget({super.key, required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl)
              )
            ),
          ),
          const SizedBox(height: 20,),
          Text(productDataModel.name,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          Text(productDataModel.description,style: const TextStyle(fontSize: 15)),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productDataModel.price}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(onPressed: () {
                    homeBloc.add(HomeProductWishlistButtonClickedEvent(clikedProduct : productDataModel));
                  }, icon: const Icon(Icons.favorite_border)),
                  IconButton(onPressed: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(clikedProduct: productDataModel));
                  }, icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],

          ),
        ],
      ),
    );
  }
}
