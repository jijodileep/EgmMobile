import 'package:egm_developer_mode/src/features/announcement/announcement.dart';
import 'package:egm_developer_mode/src/features/prayer/prayer_screen.dart';
import 'package:egm_developer_mode/src/features/prayer_request_admin/prayer_request_admin.dart';
import 'package:flutter/material.dart';

class CommunicationController extends ChangeNotifier {
  toPrayer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrayerScreen()),
    );
  }

  toAnnouncement(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Announcement()),
    );
  }

  toAdminPrayer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PrayerRequestAdmin()),
    );
  }
}
