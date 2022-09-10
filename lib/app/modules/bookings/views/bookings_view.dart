import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:justclap/app/config/routes/app_pages.dart';
import 'package:justclap/app/core/utils/app_utils.dart';
import 'package:justclap/app/domain/entities/bookings/get_booking_response/my_booking.dart';
import 'package:justclap/gen/assets.gen.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/bookings_controller.dart';

class BookingsView extends GetView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(
          'My Bookings',
          style: black18BoldTextStyle,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 1.0,
      ),
      bottomNavigationBar: Obx(() => Visibility(
            child: Container(
              width: double.infinity,
              height: 40.0,
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: primaryColor,
              ),
              child: Text(
                'Total Booking (${controller.bookingsList.length})',
                style: white16MediumTextStyle,
              ),
            ),
            visible: controller.isBookingLoading.isFalse,
          )),
      body: Obx(() => controller.isBookingLoading.value
          ? LoadingIndicator()
          : controller.bookingsList.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightBox,
                    "Pull to refresh".text.gray400.size(10).make().centered(),
                    "Recent bookings".text.make().marginAll(10),
                    SmartRefresher(
                      controller: controller.refreshController,
                      enablePullUp: true,
                      enablePullDown: true,
                      onLoading: controller.onLoading,
                      header: WaterDropHeader(),
                      onRefresh: controller.onRefresh,
                      child: ListView.builder(
                        itemCount: controller.bookingsList.length,
                        itemBuilder: (context, index) {
                          return BuildBooking(
                              item: controller.bookingsList[index]);
                        },
                      ),
                    ).expand()
                  ],
                )
              : "No upcoming bookings".text.semiBold.make().centered()),
    );
  }

  void showRatingDialog(String id) {
    final _dialog = RatingDialog(
      initialRating: 1.0,
      title: Text(
        'Rate Booking',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        controller.rateBooking(
            id, response.comment, response.rating.toString());
      },
    );

    // show the dialog
    showDialog(
      context: Get.context!,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }
}

class BuildBooking extends StatelessWidget {
  const BuildBooking({Key? key, required this.item}) : super(key: key);
  final MyBooking item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0, fixPadding * 1.5, fixPadding * 2.0, 0.0),
      child: InkWell(
          onTap: () {
            Get.toNamed(Routes.BOOKINGREQUESTDETAILS, arguments: item);
          },
          borderRadius: BorderRadius.circular(10.0),
          child: Obx(() {
            return upcomingBookingCard(
                Assets.user.user1.path,
                item.bookingId?.user?.name ?? "n/a",
                item.providerId?.serviceId?.first.name ?? "n/a",
                '${DateFormat('E, dd MMM').format(((item.bookingId?.date)!).toLocal())} : ${item.bookingId?.time}',
                item.bookingId?.id,
                (item.bookingId?.orderstatus?.value)!);
          })),
    );
  }

  upcomingBookingCard(image, name, type, time, id, String orderStatus) {
    double width = Get.size.width;
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              image,
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover,
            ),
          ),
          widthSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: black16BoldTextStyle,
                          ),
                          Text(
                            orderStatus == "assigned"
                                ? "Pending"
                                : orderStatus.capitalizeFirst!,
                            style: black16BoldTextStyle,
                          ),
                          Text(
                            type,
                            style: grey14MediumTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: false,
                      child: Container(
                        width: 40.0,
                        height: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            width: 1.0,
                            color: primaryColor,
                          ),
                          color: whiteColor,
                        ),
                        child: Icon(
                          Icons.star,
                          size: 24.0,
                          color: primaryColor,
                        ).onInkTap(() {}),
                      ),
                    ),
                  ],
                ),
                height20Space,
                Container(
                  width: width - fixPadding * 13.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        time,
                        style: black16MediumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.chat,
                              size: 20.0,
                              color: primaryColor,
                            ),
                          ),
                          widthSpace,
                          Icon(
                            Icons.call,
                            size: 20.0,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
