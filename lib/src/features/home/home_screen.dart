import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/end_point.dart';
import '../../components/common_app_bar.dart';
import '../../components/menu_component.dart';
import '../../constant/constant.dart';
import '../../provider/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('Profile'),
      drawer: Drawer(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: const SingleChildScrollView(
          child: MenuComponent(),
        ),
      ),
      body: const SafeArea(bottom: false, child: HomeView()),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    /// The above code is checking if the device's orientation is in portrait mode using the
    /// `MediaQuery.of(context).orientation` property. If the orientation is portrait, the `isPortrait`
    /// variable will be set to `true`, otherwise it will be set to `false`.
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    TextStyle headStyle =
        FontConstant.inter.copyWith(fontWeight: FontWeight.bold);
    TextStyle cellStyle = FontConstant.inter.copyWith(fontSize: 12);

    return Consumer<HomeController>(
      builder: (context, controller, child) {
        var data = controller.loginModel.data!.loguser!;
        return controller.homeLoader
            ? const Center(
                child: CircularProgressIndicator(
                    color: ColorConstant.primaryColor))
            : ListView(
                children: [
                  SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        isPortrait
                            ? Container(
                                decoration:
                                    const BoxDecoration(color: Colors.grey),
                                height: 100,
                                width: MediaQuery.sizeOf(context).width,
                                child: Image.asset(
                                  AssetsConstant.bg,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Container(),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: NetworkImage(
                                  EndPoint.imageUrl + data.photo!,
                                  scale: 1),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      data.name.toString(),
                      style: FontConstant.inter
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
                            .copyWith(top: 25),
                    child: Table(
                      children: [
                        TableRow(
                            decoration: const BoxDecoration(
                                color: ColorConstant.headColor),
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Address",
                                  style: FontConstant.inter,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  data.address.toString(),
                                  style: FontConstant.inter,
                                ),
                              ),
                            ]),
                        TableRow(
                            decoration: const BoxDecoration(
                                color: ColorConstant.dataCellColor1),
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "Phone_Number",
                                  style: FontConstant.inter,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  data.phoneNumber.toString(),
                                  style: FontConstant.inter,
                                ),
                              ),
                            ]),
                        TableRow(
                            decoration: const BoxDecoration(
                                color: ColorConstant.headColor),
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "email",
                                  style: FontConstant.inter,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  data.emailAddress.toString(),
                                  style: FontConstant.inter,
                                ),
                              ),
                            ]),
                        TableRow(
                            decoration: const BoxDecoration(
                                color: ColorConstant.dataCellColor1),
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "CentreName",
                                  style: FontConstant.inter,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  data.missionariesCategory['name'],
                                  style: FontConstant.inter,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  controller.loginModel.data!.famliy!.isEmpty
                      ? Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.sizeOf(context).height * 0.3),
                          child: Text('noDataMSG', style: FontConstant.inter),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: ColorConstant.primaryColor),
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 15),
                                child: Text('Family_Members',
                                    style: FontConstant.inter.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstant.whiteColor)),
                              ),
                              DataTable(
                                showBottomBorder: false,
                                columnSpacing:
                                    MediaQuery.sizeOf(context).width * 0.5,
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => ColorConstant.dataCellColor1),
                                border: const TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 3,
                                        color: ColorConstant.whiteColor,
                                        style: BorderStyle.solid)),
                                columns: [
                                  DataColumn(
                                      label: Text('Name', style: headStyle)),
                                  DataColumn(
                                      label:
                                          Text('Relation', style: headStyle)),
                                ],

                                /// The above code is generating a list of DataRows for a DataTable in
                                /// Dart. Each DataRow represents a row in the table and contains two
                                /// DataCells. The values for the DataCells are extracted from the
                                /// `loginModel.data.family` list. The `name` and `relation` values are
                                /// used to populate the cells in each row. The color of each DataRow is
                                /// determined based on the index of the row, with even rows having a
                                /// different color than odd rows.
                                rows: List.generate(
                                    controller.loginModel.data!.famliy!.length,
                                    (index) {
                                  var data = controller
                                      .loginModel.data!.famliy![index];
                                  var name = data.name;
                                  var relation = data.relation;
                                  return DataRow(
                                      color: MaterialStateColor.resolveWith(
                                          (states) {
                                        return index % 2 == 0
                                            ? ColorConstant.headColor
                                            : ColorConstant
                                                .dataCellColor1; //make tha magic!
                                      }),
                                      cells: [
                                        DataCell(
                                          Text(name.toString(),
                                              style: cellStyle),
                                        ),
                                        DataCell(Text(relation.toString(),
                                            style: cellStyle)),
                                      ]);
                                }),
                              ),
                            ],
                          ),
                        ),
                ],
              );
      },
    );
  }
}
