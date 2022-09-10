import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/bookingrequestdetails_controller.dart';

class BookingrequestdetailsView
    extends GetView<BookingrequestdetailsController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 1.0,
        title: Text(
          'Booking ID 2101',
          style: black18BoldTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: Obx(() {
        return controller.bookingAccepted.isTrue
            ? InkWell(
                onTap: () {
                  if (controller.bookingCompleted.isFalse) {
                    controller.completeBooking();
                  }
                },
                child: Container(
                  height: 60,
                  width: width / 2,
                  color: primaryColor,
                  alignment: Alignment.center,
                  child: Text(
                    (controller.bookingCompleted.isFalse
                        ? 'Complete Booking'
                        : "Booking Completed"),
                    style: white16MediumTextStyle,
                  ),
                ),
              )
            : Material(
                elevation: 1.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.acceptBooking(false);
                        },
                        child: Container(
                          height: double.infinity,
                          width: width / 2,
                          color: whiteColor,
                          alignment: Alignment.center,
                          child: Text(
                            'Cancel',
                            style: black16MediumTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.acceptBooking(true);
                        },
                        child: Container(
                          height: double.infinity,
                          width: width / 2,
                          color: primaryColor,
                          alignment: Alignment.center,
                          child: Text(
                            'Accept',
                            style: white16MediumTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      }),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/user/user_5.jpg',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
                fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailTile('Customer Name',
                    controller.getbooking.bookingId?.user?.name ?? "n/a"),
                detailTile('Address', controller.getAddress()),
                detailTile(
                    'Booking For',
                    controller.getbooking.providerId?.serviceId?.first.name ??
                        "n/a"),
                detailTile('Date & Time', controller.getDate()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  detailTile(title, value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: fixPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: black16BoldTextStyle),
          heightSpace,
          Text(
            value,
            style: grey14MediumTextStyle,
          ),
          heightSpace,
          Container(
            height: 1.0,
            width: double.infinity,
            color: blackColor,
          ),
        ],
      ),
    );
  }
}
