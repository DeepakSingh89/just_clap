import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:justclap/gen/assets.gen.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/widgets/column_builder.dart';
import '../controllers/reviews_controller.dart';

class ReviewsView extends GetView<ReviewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'Reviews',
          style: black18BoldTextStyle,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 1.0,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          aboutProvider(),
          Obx(() =>
              controller.loading.value ? LoadingIndicator() : recentReviews()),
        ],
      ),
    );
  }

  aboutProvider() {
    return Padding(
      padding: const EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120.0,
            height: 150.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    color: blackColor.withOpacity(0.25),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/provider/provider_7.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          widthSpace,
          Container(
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amara Smith',
                      style: black16BoldTextStyle,
                    ),
                    height5Space,
                    Text(
                      'Cleaner',
                      style: grey14MediumTextStyle,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 38.0,
                          height: 38.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                spreadRadius: 1.0,
                                color: blackColor.withOpacity(0.25),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.star_rate,
                            color: orangeColor,
                            size: 24.0,
                          ),
                        ),
                        widthSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rating',
                              style: grey14MediumTextStyle,
                            ),
                            height5Space,
                            Text(
                              '4.9 out of 5',
                              style: black14BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 38.0,
                          height: 38.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                spreadRadius: 1.0,
                                color: blackColor.withOpacity(0.25),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.group,
                            color: primaryColor,
                            size: 24.0,
                          ),
                        ),
                        widthSpace,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jobs',
                              style: grey14MediumTextStyle,
                            ),
                            height5Space,
                            Text(
                              '700+',
                              style: black14BoldTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  recentReviews() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          child: Text(
            'Recent reviews',
            style: black14BoldTextStyle,
          ),
        ),
        ColumnBuilder(
          itemCount: controller.allReviews.length,
          itemBuilder: (context, index) {
            final item = controller.allReviews[index];
            return Padding(
              padding: (index != controller.allReviews.length - 1)
                  ? EdgeInsets.fromLTRB(
                      fixPadding * 2.0, fixPadding * 2.0, fixPadding * 2.0, 0.0)
                  : const EdgeInsets.all(fixPadding * 2.0),
              child: Container(
                padding: EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      spreadRadius: 1.0,
                      color: blackColor.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            Assets.user.user1.path,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.user?.name ?? "n/a",
                                      style: black16BoldTextStyle,
                                    ),
                                    height5Space,
                                    ratingBar(item.rating ?? 5),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Cleaning",
                                    style: black14MediumTextStyle,
                                  ),
                                  height5Space,
                                  Text(
                                    item.createdAt != null
                                        ? DateFormat('E, dd MMM').format(
                                            DateTime.parse((item.createdAt)!)
                                                .toLocal())
                                        : "n/a",
                                    style: grey14RegularTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                    Text(
                      item.review ?? "n/a",
                      style: black16MediumTextStyle,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  ratingBar(number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (number == 1 ||
                number == 2 ||
                number == 3 ||
                number == 4 ||
                number == 5)
            ? Icon(
                Icons.star_rate,
                size: 16.0,
                color: orangeColor,
              )
            : Container(),
        (number == 2 || number == 3 || number == 4 || number == 5)
            ? Icon(
                Icons.star_rate,
                size: 16.0,
                color: orangeColor,
              )
            : Container(),
        (number == 3 || number == 4 || number == 5)
            ? Icon(
                Icons.star_rate,
                size: 16.0,
                color: orangeColor,
              )
            : Container(),
        (number == 4 || number == 5)
            ? Icon(
                Icons.star_rate,
                size: 16.0,
                color: orangeColor,
              )
            : Container(),
        (number == 5)
            ? Icon(
                Icons.star_rate,
                size: 16.0,
                color: orangeColor,
              )
            : Container(),
      ],
    );
  }
}
