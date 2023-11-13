import 'package:egm_developer_mode/src/features/add_year_plan/add_year_plan.dart';
import 'package:flutter/material.dart';
import '../model/year_plan_model.dart';
import '../services/report_service.dart';

class YearPlanController extends ChangeNotifier {
  late String id;
  var loader = false;

  List<Datum> yearData = <Datum>[];

  getYearPlan() async {
    loader = true;
    var httpResponse = await ReportService().getYearPlan(id);
    if (!httpResponse.hasError) {
      var data = YearPlanModel.fromMap(httpResponse.response!.data!);
      yearData = data.data!;
      loader = false;
    } else {
      loader = true;
    }
  }

  toAdd(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddYearPlan()),
    );
  }
}
