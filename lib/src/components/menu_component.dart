import 'package:flutter/material.dart';

import '../constant/constant.dart';
import '../data/app_data.dart';
import '../features/announcement/announcement.dart';
import '../features/charity_report/charity_report_screen.dart';
import '../features/daily_report/daily_report_screen.dart';
import '../features/gift/gift.dart';
import '../features/home/home_screen.dart';
import '../features/membership/membership_screen.dart';
import '../features/sunday/sunday_screen.dart';
import '../features/year_plan/year_plan.dart';
import '../widget/menu_widget.dart';

final List locale = [
  {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
];
updateLanguage(Locale locale, context) {
  Navigator.pop(context);
}

// Application language choose option ,
// with native build context
buildLanguageDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text(
            'chooseLanguage',
            style: FontConstant.inter
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: Text(locale[index]['name']),
                      onTap: () {
                        // print(locale[index]['name']);
                        var text = locale[index]['locale'].toString();
                        AppData().storeLanguageCode(text[0] + text[1]);
                        AppData().storeCountryCode(text[3] + text[4]);
                        updateLanguage(locale[index]['locale'], context);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: locale.length),
          ),
        );
      });
}

/// side menu navigation with custom component and
/// logout option

class MenuComponent extends StatelessWidget {
  const MenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Menu header Component
      const MenuTopHead(),

      MenuWidget(
          name: 'Profile',
          icon: AssetsConstant.profile,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }),
      MenuWidget(
          name: 'Membership',
          icon: AssetsConstant.membership,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MembershipScreen()),
            );
          }),
      MenuWidget(
          name: 'Daily Reports',
          icon: AssetsConstant.dailyReport,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DailyReportScreen()),
            );
          }),
      MenuWidget(
          name: 'CharityReport',
          icon: AssetsConstant.yearlyReport,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CharityReportScreen()),
            );
          }),
      MenuWidget(
          name: 'meetingReport',
          icon: AssetsConstant.sunday,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SundayScreen()),
            );
          }),

      MenuWidget(
          name: 'Communications',
          icon: AssetsConstant.prayerRequest,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Announcement()),
            );
          }),

      MenuWidget(
          name: 'Registration',
          icon: AssetsConstant.gift,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Gift()),
            );
          }),

      MenuWidget(
          name: 'YearPlan',
          icon: AssetsConstant.yearlyReport,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const YearPlan()),
            );
          }),

      MenuWidget(
          name: 'Language',
          icon: AssetsConstant.language,
          action: () {
            buildLanguageDialog(context);
          }),
      // MenuWidget(
      //     name: 'Contact Us'.tr, icon: AssetsConstant.contactUs, action: () {}),
      MenuWidget(
          name: 'Logout',
          icon: AssetsConstant.logout,
          action: () {
            AlertDialog(
              title: const Text('Logout'),
              content: const Text('logoutMsg'),
              actions: [
                TextButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context)),
                GestureDetector(
                  onTap: () async {
                    AppData().clearData();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Text('Logout',
                        style: FontConstant.inter.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: ColorConstant.whiteColor)),
                  ),
                )
              ],
            );
          })
    ]);
  }
}

/// menu top head section and UI render for both mobile and tablet
/// support #7.00 and above

class MenuTopHead extends StatelessWidget {
  const MenuTopHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorConstant.primaryColor),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.05,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).size.height * 0.015),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(AssetsConstant.logo),
            radius: 50,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'HeadText',
                  textAlign: TextAlign.start,
                  style: FontConstant.inter.copyWith(
                      color: ColorConstant.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: ColorConstant.whiteColor,
                      size: 4,
                    ),
                    Text(
                      ' (+91) 8281616654 (Office)',
                      style: FontConstant.inter.copyWith(
                          color: ColorConstant.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.mail,
                      color: ColorConstant.whiteColor,
                      size: 14,
                    ),
                    Text(
                      ' egmofindia@gmail.com',
                      style: FontConstant.inter.copyWith(
                          color: ColorConstant.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
