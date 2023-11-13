import 'package:flutter/material.dart';
import '../model/get_family_member_model.dart';
import '../services/family_service.dart';
import '../utils/utils.dart';
import 'package:egm_developer_mode/src/features/create_member/create_member_screen.dart';
import 'package:egm_developer_mode/src/features/edit_family/edit_family_screen.dart';
import 'package:egm_developer_mode/src/features/edit_member.dart/edit_member_screen.dart';

class MemberController extends ChangeNotifier {
  late String familyId;
  late String id;

  var memberLoader = true;

  GetFamilyMemberModel? getFamilyMemberModel;
  List<FamilyMemberData> familyMemberData = <FamilyMemberData>[];
  List familyMemberDataWithoutHead = [];

  getFamilyMembers() async {
    memberLoader = true;
    var httpResponse = await FamilyService().getFamilyMembers(familyId);
    if (!httpResponse.hasError) {
      getFamilyMemberModel =
          GetFamilyMemberModel.fromMap(httpResponse.response!.data);
      familyMemberData = getFamilyMemberModel!.data!;
      if (familyMemberData.length > 1) {
        familyMemberDataWithoutHead = getFamilyMemberModel!.data!;
      }
      memberLoader = false;
      notifyListeners();
    } else {
      memberLoader = true;
      Utils().cancelToast();
      Utils().showToast('something_error');
      notifyListeners();
    }
  }

  toCreateMember(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateMemberScreen()),
    );
  }

  toEditMember(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditMemberScreen()),
    );
  }

  toEditFamily(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditFamilyScreen()),
    );
  }
}
