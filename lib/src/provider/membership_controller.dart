import 'package:flutter/material.dart';
import '../model/get_family_model.dart';
import '../services/family_service.dart';
import '../utils/utils.dart';
import 'package:egm_developer_mode/src/features/create_family/create_family_screen.dart';
import 'package:egm_developer_mode/src/features/member/member_screen.dart';

class MembershipController extends ChangeNotifier {
  late String id;
  var membershipLoader = true;
  List<FamilyData> familyData = <FamilyData>[];

  fetchGetFamily() async {
    membershipLoader = true;
    var httpResponse = await FamilyService().getFamily(id);
    if (!httpResponse.hasError) {
      var data = GetFamilyModel.fromMap(httpResponse.response!.data);
      familyData = data.data!;
    } else {
      Utils().cancelToast();
      membershipLoader = false;
      Utils().showToast('something_error');
    }
  }

  toCreateFamily(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateFamilyScreen()),
    );
  }

  toMember(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MemberView()),
    );
  }
}
