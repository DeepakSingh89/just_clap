import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/resources/app_resources.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Chats',
          style: appBarTextStyle,
        ),
      ),
      body: (controller.chatList.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    color: greyColor,
                    size: 70.0,
                  ),
                  heightSpace,
                  Text(
                    'No Chat Available',
                    style: grey14MediumTextStyle,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: controller.chatList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = controller.chatList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     PageTransition(
                        //         duration: Duration(milliseconds: 500),
                        //         type: PageTransitionType.rightToLeft,
                        //         child: ChatScreen(name: item['name'])));
                      },
                      child: Container(
                        padding: EdgeInsets.all(fixPadding * 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                border:
                                    Border.all(width: 0.3, color: primaryColor),
                                image: DecorationImage(
                                  image: AssetImage(item['image']!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['name']!,
                                              style: black16MediumTextStyle,
                                            ),
                                            SizedBox(width: 7.0),
                                            (item['status'] == 'unread')
                                                ? Container(
                                                    width: 10.0,
                                                    height: 10.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      color: primaryColor,
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                        heightSpace,
                                        Text(
                                          item['msg']!,
                                          style: grey14MediumTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      Text(
                                        item['time']!,
                                        style: grey14MediumTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    divider(),
                  ],
                );
              },
            ),
    );
  }

  divider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      width: Get.size.width - fixPadding * 4.0,
      height: 1.0,
      color: Colors.grey[200],
    );
  }
}
