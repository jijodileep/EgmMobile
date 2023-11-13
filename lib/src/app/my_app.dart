import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constant/constant.dart';
import '../features/home/home_screen.dart';
import '../features/login/login_screen.dart';
import '../provider/add_charity_report_controller.dart';
import '../provider/add_comment_controller.dart';
import '../provider/add_daily_report_controller.dart';
import '../provider/add_gift_controller.dart';
import '../provider/add_leave_controller.dart';
import '../provider/add_prayer_controller.dart';
import '../provider/add_prayer_request_controller.dart';
import '../provider/add_sunday_controller.dart';
import '../provider/add_year_plan_controller.dart';
import '../provider/announcement_controller.dart';
import '../provider/charity_report_controller.dart';
import '../provider/charity_report_details_controller.dart';
import '../provider/communication_controller.dart';
import '../provider/create_family_controller.dart';
import '../provider/create_member_controller.dart';
import '../provider/daily_detail_controller.dart';
import '../provider/daily_report_controller.dart';
import '../provider/distribution_controller.dart';
import '../provider/edit_family_controller.dart';
import '../provider/edit_gift_register_controller.dart';
import '../provider/edit_meeting_controller.dart';
import '../provider/edit_member_controller.dart';
import '../provider/education_gift_controller.dart';
import '../provider/gift_controller.dart';
import '../provider/gift_detail_controller.dart';
import '../provider/gift_register_controller.dart';
import '../provider/gift_register_detail_controller.dart';
import '../provider/home_controller.dart';
import '../provider/leave_controller.dart';
import '../provider/login_controller.dart';
import '../provider/meeting_detail_controller.dart';
import '../provider/member_controller.dart';
import '../provider/membership_controller.dart';
import '../provider/other_gift_controller.dart';
import '../provider/prayer_controller.dart';
import '../provider/prayer_details_controller.dart';
import '../provider/prayer_request_admin_controller.dart';
import '../provider/sunday_controller.dart';
import '../provider/year_plan_controller.dart';

/// The MyApp class is a StatelessWidget that builds the main MaterialApp widget for the application,
/// providing various ChangeNotifierProviders and setting the initial screen based on whether the user
/// is logged in or not.
class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MyApp({
    Key? key,
    required this.isUserLoggedIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AddCharityReportController()),
        ChangeNotifierProvider(create: (_) => AddCommentController()),
        ChangeNotifierProvider(create: (_) => AddDailyReportController()),
        ChangeNotifierProvider(create: (_) => AddGiftController()),
        ChangeNotifierProvider(create: (_) => AddLeaveController()),
        ChangeNotifierProvider(create: (_) => AddPrayerController()),
        ChangeNotifierProvider(create: (_) => AddPrayerRequestController()),
        ChangeNotifierProvider(create: (_) => AddSundayController()),
        ChangeNotifierProvider(create: (_) => AddYearPlanController()),
        ChangeNotifierProvider(create: (_) => AnnouncementController()),
        ChangeNotifierProvider(create: (_) => CharityReportController()),
        ChangeNotifierProvider(create: (_) => CharityReportDetailsController()),
        ChangeNotifierProvider(create: (_) => CommunicationController()),
        ChangeNotifierProvider(create: (_) => CreateFamilyController()),
        ChangeNotifierProvider(create: (_) => CreateMemberController()),
        ChangeNotifierProvider(create: (_) => DailyDetailController()),
        ChangeNotifierProvider(create: (_) => DailyReportController()),
        ChangeNotifierProvider(create: (_) => DistributionController()),
        ChangeNotifierProvider(create: (_) => EditFamilyController()),
        ChangeNotifierProvider(create: (_) => EditGiftRegisterController()),
        ChangeNotifierProvider(create: (_) => EditMeetingController()),
        ChangeNotifierProvider(create: (_) => EditMemberController()),
        ChangeNotifierProvider(create: (_) => EducationGiftController()),
        ChangeNotifierProvider(create: (_) => GiftController()),
        ChangeNotifierProvider(create: (_) => GiftDetailController()),
        ChangeNotifierProvider(create: (_) => GiftRegisterController()),
        ChangeNotifierProvider(create: (_) => GiftRegisterDetailController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => LeaveController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => MeetingDetailController()),
        ChangeNotifierProvider(create: (_) => MemberController()),
        ChangeNotifierProvider(create: (_) => MembershipController()),
        ChangeNotifierProvider(create: (_) => OtherGiftController()),
        ChangeNotifierProvider(create: (_) => PrayerController()),
        ChangeNotifierProvider(create: (_) => PrayerDetailsController()),
        ChangeNotifierProvider(create: (_) => PrayerRequestAdminController()),
        ChangeNotifierProvider(create: (_) => SundayController()),
        ChangeNotifierProvider(create: (_) => YearPlanController()),
      ],

      /// The `child: MaterialApp()` widget is the main widget of the application. It represents the root
      /// of the widget tree and provides various configuration options for the application.
      child: MaterialApp(
        title: StringConstant.appTitle,
        navigatorKey: MyApp.navigatorKey,
        color: ColorConstant.primaryColor,
        debugShowCheckedModeBanner: false,
        home: isUserLoggedIn ? const HomeScreen() : const LoginScreen(),
        builder: ((context, widget) {
          return MediaQuery(
            ///Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        }),
      ),
    );
  }
}
