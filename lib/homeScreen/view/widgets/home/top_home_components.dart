import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/home_export.dart';
import 'package:foodieapp/homeScreen/view/model/demo_model.dart';
import 'package:foodieapp/homeScreen/view/widgets/home/offer_banner.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TopHomeComponents extends StatelessWidget {
  TopHomeComponents({super.key});

  // int activeIndex = 0;
  // bool isButtonBanner = true;

  final ref = FirebaseDatabase.instance.ref('post/-NRWifmDJwiwH8wwvlhV');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ref.onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            !snapshot.hasError &&
            snapshot.data!.snapshot.value != null) {
          final snap = snapshot.data!.snapshot.value as Map<Object?, Object?>;
          final snapData = HomeModel.fromJson(snap);
          return Column(
            children: [
              Container(
                height: 20.5.h,
                width: 90.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: PageView.builder(
                  controller: PageController(viewportFraction: .95),
                  onPageChanged: (index) {
                    context.read<HomeScreenBloc>().add(PageChange(idx: index));
                    // setState(() {
                    //   activeIndex = index;
                    //   isButtonBanner = false;
                    // });
                  },
                  // scrollDirection: Axis.horizontal,
                  itemCount: snapData.banners.length,
                  //  imgList.length,
                  itemBuilder: (context, index) {
                    // final img = imgList[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 15.sp),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: OfferBanner(
                          snapData: snapData,
                          indexx: index,
                          isButtonBanner: index == 0 ? true : false,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  return AnimatedSmoothIndicator(
                    activeIndex: state.activeIndex ?? 0,
                    count: snapData.banners.length,
                    effect: const WormEffect(
                      // radius:  4.0,
                      dotWidth: 8,
                      dotHeight: 9,
                      paintStyle: PaintingStyle.stroke,
                      //strokeWidth:  1.5,
                      //dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                    ),
                  );
                },
              )
            ],
          );
        } else {
          return Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.grey.shade300,
              child: Container(
                height: 22.h,
                width: 78.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),),
              ),);
          
        }
      },
    );
  }
}
