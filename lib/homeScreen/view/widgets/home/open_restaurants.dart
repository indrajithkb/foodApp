// ignore_for_file: lines_longer_than_80_chars, cast_nullable_to_non_nullable, unused_local_variable

import 'dart:ui';

import 'package:api_repository/model/home_model_class.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/cart_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/home_screen_bloc.dart';
// import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/hotel_details.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/offer_box.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/shimmer_effect.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/OpenSelectedRest_widgets/switch_buttons.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/top_bar_restaurants.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class OpenSelectedRestaurant extends StatelessWidget {
  OpenSelectedRestaurant(
      {required this.userDatas, required this.index, super.key});
  List<XploreResto> userDatas;
  int index;
  final TextEditingController _searchController = TextEditingController();
  final ref =
      FirebaseDatabase.instance.ref('recommendeddish/-NSu2Qk_NJNeKiuv3-yX');
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarRestaurants(
              userDatas: userDatas,
              index: index,
              searchController: _searchController,
              onChanged: (value) {
                context.read<CartBloc>().add(SearchFetchedData(val: value));
              },
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HotelDetails(
                    userDatas: userDatas,
                    index: index,
                  ),
                  const OfferBox(),
                  const SwitchVegNon(),
                  BlocBuilder<ApiHomeBloc, ApiHomeState>(
                    builder: (context, state) {
                      if (state is RecommendedDishDataLoaded) {
                        return StreamBuilder(
                          stream: ref.onValue,
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                !snapshot.hasError &&
                                snapshot.data!.snapshot.value != null) {
                              final snap = snapshot.data!.snapshot.value
                                  as Map<Object?, Object?>;

                              final snapData = NSu2QkNjNeKiuv3YX.fromJson(snap);
                              final snapDatas = snapData.dishDetails;
                              context
                                  .read<CartBloc>()
                                  .add(FetchDatas(dishList: snapDatas));

                              return BlocBuilder<CartBloc, CartState>(
                                builder: (context, state) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Recommended (${snapData.recommendedDishes})',
                                        style: FoodDeliveryTextStyles
                                            .homeScreenTitles,
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      SizedBox(
                                        height: 65.h,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: state.searchList.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 51.w,
                                                  // color: Colors.amber,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      state.searchList[index]
                                                              .vegStatus
                                                              .contains(
                                                        'false',
                                                      )
                                                          ? Image.asset(
                                                              'assets/images/Non veg.png',
                                                            )
                                                          : Image.asset(
                                                              'assets/images/vegIcon.png',
                                                            ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        state.searchList[index]
                                                            .dishName,
                                                        style:
                                                            FoodDeliveryTextStyles
                                                                .homeScreenTitles
                                                                .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      SizedBox(
                                                        height: 3.h,
                                                        width: 25.w,
                                                        // color: Colors.red,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                SizedBox(
                                                                  height: 2.5.h,
                                                                  width: 13.w,
                                                                  child:
                                                                      ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          const Color(
                                                                        0xFFFFFFFF,
                                                                      ),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Container(),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  left: 4,
                                                                  bottom: 2,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(
                                                                          right:
                                                                              2.sp,
                                                                        ),
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .star,
                                                                          size:
                                                                              15,
                                                                          color:
                                                                              Color(
                                                                            0xFF1D9F80,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        state
                                                                            .searchList[index]
                                                                            .rating
                                                                            .toString(),

                                                                        // '4.5',
                                                                        style: FoodDeliveryTextStyles
                                                                            .addressBookButtons
                                                                            .copyWith(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                        overflow:
                                                                            TextOverflow.clip,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            Text(
                                                              '${FoodDeliveryConstantText.rupeesSymbol} ${state.searchList[index].price}',
                                                              style: FoodDeliveryTextStyles
                                                                  .homeScreenTitles
                                                                  .copyWith(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 1.h,
                                                      ),
                                                      Text(
                                                        state.searchList[index]
                                                            .content,
                                                        maxLines: 2,
                                                        style:
                                                            FoodDeliveryTextStyles
                                                                .editProfileTexts,
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 12.sp,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      SizedBox(
                                                        height: 17.h,
                                                        child: Image.network(
                                                          state
                                                              .searchList[index]
                                                              .image,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: -9,
                                                        bottom: 5,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            right: 2.h,
                                                          ),
                                                          child:
                                                              AnimatedContainer(
                                                            duration:
                                                                const Duration(
                                                              seconds: 1,
                                                            ),
                                                            // width: 5,height: 2,color: Colors.amber,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                25,
                                                              ),
                                                              child: isExpand
                                                                  ? Container(
                                                                      height:
                                                                          5.h,
                                                                      width:
                                                                          25.w,
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          BackdropFilter(
                                                                            filter:
                                                                                ImageFilter.blur(
                                                                              sigmaX: 4,
                                                                              sigmaY: 4,
                                                                            ),
                                                                            child:
                                                                                Container(),
                                                                          ),
                                                                          DecoratedBox(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(25),
                                                                              border: Border.all(
                                                                                color: Colors.white70,
                                                                              ),
                                                                              gradient: LinearGradient(
                                                                                begin: Alignment.topLeft,
                                                                                end: Alignment.bottomRight,
                                                                                colors: [
                                                                                  Colors.white.withOpacity(0.15),
                                                                                  Colors.white.withOpacity(0.05),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                SizedBox(
                                                                              height: 5.h,
                                                                              width: 25.w,
                                                                              child: Padding(
                                                                                padding: EdgeInsets.only(
                                                                                  bottom: 8.sp,
                                                                                  top: 8.sp,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        // if (cartDetails!.quantity <= 1) {
                                                                                        //   setState(() {
                                                                                        //     cartData.remove(filterVegNonList[index].id.toString());
                                                                                        //     if (cartData.isEmpty) {
                                                                                        //       isCartButtonVisible = false;
                                                                                        //     }
                                                                                        //   });
                                                                                        // } else {
                                                                                        //   setState(() {
                                                                                        //     cartData.update(filterVegNonList[index].id.toString(), (value) {
                                                                                        //       return CartModel(
                                                                                        //         content: value.content,
                                                                                        //         dishName: value.dishName,
                                                                                        //         id: value.id,
                                                                                        //         image: value.image,
                                                                                        //         price: value.price,
                                                                                        //         rating: value.rating,
                                                                                        //         vegStatus: value.vegStatus,
                                                                                        //         quantity: value.quantity - 1,
                                                                                        //       );
                                                                                        //     });
                                                                                        //   });
                                                                                        // }
                                                                                      },
                                                                                      child: SizedBox(
                                                                                        height: 4.h,
                                                                                        width: 4.h,
                                                                                        child: Image.asset(
                                                                                          'assets/images/minusButton.png', color: Colors.white70,
                                                                                          // fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      '0',
                                                                                      // cartDetails!.quantity.toString(),
                                                                                      style: const TextStyle(fontSize: 20, color: Colors.white),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        // setState(() {
                                                                                        //   cartData.update(filterVegNonList[index].id.toString(), (value) {
                                                                                        //     return CartModel(
                                                                                        //       content: value.content,
                                                                                        //       dishName: value.dishName,
                                                                                        //       id: value.id,
                                                                                        //       image: value.image,
                                                                                        //       price: value.price,
                                                                                        //       rating: value.rating,
                                                                                        //       vegStatus: value.vegStatus,
                                                                                        //       quantity: value.quantity + 1,
                                                                                        //     );
                                                                                        //   });
                                                                                        // }
                                                                                        // );
                                                                                      },
                                                                                      child: SizedBox(
                                                                                        height: 4.h,
                                                                                        width: 4.h,
                                                                                        child: Image.asset(
                                                                                          'assets/images/add.png', color: Colors.white70,
                                                                                          // fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  : InkWell(
                                                                      onTap:
                                                                          () {
                                                                        // setState(() {
                                                                        // cartData[filterVegNonList[index].id.toString()] = CartModel(
                                                                        //   content: filterVegNonList[index].content,
                                                                        //   dishName: filterVegNonList[index].dishName,
                                                                        //   id: filterVegNonList[index].id,
                                                                        //   image: filterVegNonList[index].image,
                                                                        //   price: filterVegNonList[index].price,
                                                                        //   rating: filterVegNonList[index].rating,
                                                                        //   vegStatus: filterVegNonList[index].vegStatus,
                                                                        //   quantity: 1,
                                                                        // );
                                                                        //   if (cartData.isNotEmpty) {
                                                                        //     // print('add item');
                                                                        //     isCartButtonVisible = true;
                                                                        //   }
                                                                        // });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            4.5.h,
                                                                        width:
                                                                            4.5.h,
                                                                        decoration:
                                                                            const BoxDecoration(
                                                                          color:
                                                                              Color(
                                                                            0xFF1D9F80,
                                                                          ),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(
                                                                            14,
                                                                          ),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/add.png',
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: FoodDeliveryColor.buttonColor,
                                ),
                              );
                            }
                          },
                        );
                      } else if (state is RecommendedDishDataLoading) {
                        return ShimmerEffect();
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: FoodDeliveryColor.buttonColor,
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
