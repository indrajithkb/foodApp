// ignore_for_file: lines_longer_than_80_chars, cast_nullable_to_non_nullable, unused_local_variable, prefer_if_elements_to_conditional_expressions

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/bloc/api_home_bloc.dart';
import 'package:foodieapp/homeScreen/view/model/api_home_model.dart';
import 'package:foodieapp/homeScreen/view/model/recommended_dishes.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/top_bar_restaurants.dart';
import 'package:foodieapp/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class SelectedRestaurants extends StatefulWidget {
  SelectedRestaurants({
    required this.userDatas,
    required this.index,
    super.key,
  });
  List<XploreResto> userDatas;
  int index;

  @override
  State<SelectedRestaurants> createState() => _SelectedRestaurantsState();
}

class _SelectedRestaurantsState extends State<SelectedRestaurants> {
  bool isVeg = false;
  bool isNonVeg = false;
  final ref =
      FirebaseDatabase.instance.ref('recommendeddish/-NSu2Qk_NJNeKiuv3-yX');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBarRestaurants(userDatas: widget.userDatas, index: widget.index),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userDatas[widget.index].hotel,
                    style: FoodDeliveryTextStyles.homeScreenTitles
                        .copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  SizedBox(
                    height: 3.h,
                    width: 28.w,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 2.7.h,
                              width: 13.w,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Container(),
                              ),
                            ),
                            Positioned(
                              left: 4,
                              bottom: 2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.sp),
                                    child: const Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Color(0xFF1D9F80),
                                    ),
                                  ),
                                  Text(
                                    widget.userDatas[widget.index].rating
                                        .toString(),

                                    // '4.5',
                                    style: FoodDeliveryTextStyles
                                        .addressBookButtons
                                        .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          '${widget.userDatas[widget.index].time} min',
                          style:
                              FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Text(
                    'North Indian,South Indian,Kerala...',
                    style: FoodDeliveryTextStyles.editProfileTexts,
                  ),
                  SizedBox(
                    height: .5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.userDatas[widget.index].place} - ${widget.userDatas[widget.index].distance} km',
                        style: FoodDeliveryTextStyles.homeScreenTitles.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: FoodDeliveryColor.logoutButtonColor,
                        size: 18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 8.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: FoodDeliveryColor.logoutButtonColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/offerpercent.png'),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 15.sp,
                            top: 2.sp,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '20% off upto ${FoodDeliveryConstantText.rupeesSymbol}120',
                                style: FoodDeliveryTextStyles.homeScreenTitles,
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(
                                'Use Federalcc-Above ${FoodDeliveryConstantText.rupeesSymbol}249',
                                style: FoodDeliveryTextStyles.homeScreenTitles
                                    .copyWith(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: .5.h,
                  // ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1,
                        child: Switch(
                          activeThumbImage:
                              const AssetImage('assets/images/vegIcon.png'),
                          inactiveThumbImage: const AssetImage(
                            'assets/images/veg.png',
                          ),
                          value: isVeg,
                          activeColor: const Color(0xFF1D9F80),
                          onChanged: (value) {
                            setState(() {
                              isVeg = !isVeg;
                            });
                          },
                        ),
                      ),
                      Transform.scale(
                        scale: 1,
                        child: Switch(
                          activeThumbImage:
                              const AssetImage('assets/images/Non veg.png'),
                          inactiveThumbImage: const AssetImage(
                            'assets/images/nonVegIcon.png',
                          ),
                          value: isNonVeg,
                          activeColor: FoodDeliveryColor.logoutButtonColor,
                          onChanged: (value) {
                            setState(() {
                              isNonVeg = !isNonVeg;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
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

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Recommended (${snapData.recommendedDishes})',
                                    style:
                                        FoodDeliveryTextStyles.homeScreenTitles,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  SizedBox(
                                    height: 65.h,
                                    // color: Colors.amber,
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: snapData.dishDetails.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 51.w,
                                              // color: Colors.amber,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  snapData.dishDetails[index]
                                                          .vegStatus
                                                          .contains('false')
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
                                                    snapData.dishDetails[index]
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
                                                                        BorderRadius
                                                                            .circular(
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
                                                                        EdgeInsets
                                                                            .only(
                                                                      right:
                                                                          2.sp,
                                                                    ),
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .star,
                                                                      size: 15,
                                                                      color:
                                                                          Color(
                                                                        0xFF1D9F80,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    
                                                                    snapData
                                                                        .dishDetails[
                                                                            index]
                                                                        .rating
                                                                        .toString(),

                                                                    // '4.5',
                                                                    style: FoodDeliveryTextStyles
                                                                        .addressBookButtons
                                                                        .copyWith(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),overflow: TextOverflow.clip,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          '${FoodDeliveryConstantText.rupeesSymbol} ${snapData.dishDetails[index].price}',
                                                          style: FoodDeliveryTextStyles
                                                              .homeScreenTitles
                                                              .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    snapData.dishDetails[index]
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
                                            Stack(
                                              children: [
                                                SizedBox(
                                                  height: 17.h,
                                                  child: Image.network(
                                                    snapData.dishDetails[index]
                                                        .image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  right: -12,
                                                  bottom: 5,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 2.h,
                                                    ),
                                                    child: Container(
                                                      height: 4.5.h,
                                                      width: 4.5.h,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Color(0xFF1D9F80),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(14),
                                                        child: Image.asset(
                                                          'assets/images/add.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ],
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
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.grey.shade300,
                          child: SizedBox(
                            height: 65.h,
                            // color: Colors.amber,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              // itemCount: snapData.dishDetails.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 51.w,
                                      // color: Colors.amber,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 2.h,
                                            width: 15.w,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 2.h,
                                            width: 24.w,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 2.h,
                                            width: 45.w,
                                          ),
                                          SizedBox(
                                            height: .5.h,
                                          ),
                                          Container(
                                            color: Colors.white,
                                            height: 2.h,
                                            width: 47.w,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 17.h,
                                      child: Container(
                                        height: 17.h,
                                        width: 28.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        // print("err");
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}