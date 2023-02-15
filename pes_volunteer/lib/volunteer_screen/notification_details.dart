import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pes/cubit/login_cubit.dart';
import 'package:pes/cubit/notifications_cubit.dart';
import 'package:pes/data/models/notification.dart';

import '../constants/strings.dart';
import '../data/models/user.dart';

class NotificationDetails extends StatelessWidget {
  AppNotification appNotification;
  final String timeRecieved;
  NotificationDetails(
      {required this.appNotification, Key? key, required this.timeRecieved})
      : super(key: key);

  NotificationsCubit? notificationsCubit;

  User user = User.empty(token: "");

  @override
  Widget build(BuildContext context) {
    user = BlocProvider.of<LoginCubit>(context).user;
    notificationsCubit = BlocProvider.of<NotificationsCubit>(context);
    notificationsCubit!.readNotifications(user.token, appNotification.id);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // drawer: SideDrawer(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: Container(
        color: appBarColor,
        child: Container(
          padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                appNotification.title,
                softWrap: true,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Align(
                child: Text(
                  timeRecieved,
                  style: TextStyle(
                      color: Color(0xff838a8d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                alignment: Alignment.centerRight,
              ),
              Spacer(),
              Expanded(
                flex: 10,
                child: ListView(
                  children: [
                    Text(
                      appNotification.description,
                      softWrap: true,
                      maxLines: null,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return Material(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text(
    //         "FAQs",
    //         style: TextStyle(
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //             fontFamily: "Sans-Serif",
    //             fontSize: 25 * MediaQuery.of(context).devicePixelRatio / 2.6),
    //       ),
    //       elevation: 0,
    //       backgroundColor: Colors.transparent,
    //       iconTheme: IconThemeData(
    //         color: Colors.black, //change your color here
    //       ),
    //     ),
    //     body: LayoutBuilder(
    //         builder: (context, BoxConstraints constraints) => Container(
    //               margin: EdgeInsets.fromLTRB(20, 4, 20, 4),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                     width: MediaQuery.of(context).size.width,
    //                     child: Align(
    //                       child: Text(
    //                         faq.faqQuestion,
    //                         style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             fontFamily: "Sans-Serif",
    //                             fontSize: 20 *
    //                                 MediaQuery.of(context).devicePixelRatio /
    //                                 2.6),
    //                       ),
    //                       alignment: Alignment.centerLeft,
    //                     ),
    //                   ),
    //                   Divider(thickness: 1),
    //                   Expanded(
    //                     flex: 20,
    //                     child: Container(
    //                       width: constraints.maxWidth,
    //                       child: Text(
    //                         faq.solution,
    //                         softWrap: true,
    //                         maxLines: null,
    //                         style: TextStyle(
    //                             fontFamily: "Sans-Serif",
    //                             fontSize: 20 *
    //                                 MediaQuery.of(context).devicePixelRatio /
    //                                 2.6),
    //                       ),
    //                     ),
    //                   ),
    //                   Spacer(flex: 1),
    //                 ],
    //               ),
    //             )),
    //   ),
    // );
  }
}
