// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../api/end_point.dart';
import '../../components/common_app_bar.dart';
import '../../constant/constant.dart';
import '../../utils/utils.dart';

class MemberDetailsScreen extends StatelessWidget {
  const MemberDetailsScreen({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.photo,
    required this.gender,
    required this.age,
    required this.dob,
    required this.education,
    required this.dateOfMembership,
    required this.isBaptism,
    required this.baptismChurch,
    required this.dateOfBaptism,
    required this.occupation,
    required this.isMarried,
    required this.relation,
    required this.isDead,
  }) : super(key: key);

  final String name;
  final String age;
  final String gender;
  final String education;
  final String isBaptism;
  final String baptismChurch;
  final String occupation;
  final String dateOfBaptism;
  final String dateOfMembership;
  final dynamic isMarried;
  final String photo;
  final String phoneNumber;
  final String dob;
  final String relation;
  final bool isDead;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: commonAppBar('headTextSplit'),
      body: SafeArea(
        bottom: false,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorConstant.primaryColor)),
                  child: Image.network(
                    EndPoint.imageUrl + photo,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                Table(
                  textDirection: TextDirection.ltr,
                  border: const TableBorder(
                      left: BorderSide(color: Colors.blue, width: 1),
                      right: BorderSide(color: Colors.blue, width: 1),
                      top: BorderSide(color: Colors.blue, width: 1),
                      bottom: BorderSide(color: Colors.blue, width: 1),
                      horizontalInside: BorderSide(
                        width: 1,
                        color: ColorConstant.primaryColor,
                      )),
                  defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Name',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          name,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Phone_Number',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          phoneNumber,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Gender',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          gender.toString() == '0'
                              ? 'Male'
                              : gender == '1'
                                  ? 'Female'
                                  : 'Others',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Age',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          age,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'dateOfBirth',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          Utils().convertDateTimeDisplay(dob),
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Education',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          education,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Date_Of_Membership',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          Utils().convertDateTimeDisplay(dateOfMembership),
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Is_Baptism',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          isBaptism,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Church_Name',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          baptismChurch,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Occupation',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          occupation,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Is_Married',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          isMarried.toString() == '0'
                              ? 'Married'
                              : isMarried == '1'
                                  ? 'NonMarried'
                                  : isMarried == '2'
                                      ? 'Divorced'
                                      : isMarried == '3'
                                          ? 'Separated'
                                          : 'Others',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8)
                            .copyWith(left: 06),
                        child: Text(
                          'Relation',
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          relation,
                          style: FontConstant.inter
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ]),
                    isDead == true
                        ? TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8)
                                  .copyWith(left: 06),
                              child: Text(
                                'isDead',
                                style: FontConstant.inter
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                isDead.toString(),
                                style: FontConstant.inter
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ),
                          ])
                        : TableRow(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8)
                                  .copyWith(left: 06),
                              child: Text(
                                '',
                                style: FontConstant.inter
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                '',
                                style: FontConstant.inter
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ),
                          ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
