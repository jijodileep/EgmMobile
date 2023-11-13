import 'package:egm_developer_mode/src/features/education_gift/education_gift.dart';
import 'package:egm_developer_mode/src/features/other_gift/other_gift.dart';
import 'package:flutter/material.dart';

class GiftController extends ChangeNotifier {
  toEducation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EducationGift()),
    );
  }

  toOther(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OtherGift()),
    );
  }
}
