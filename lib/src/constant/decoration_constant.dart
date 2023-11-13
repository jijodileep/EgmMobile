import 'package:flutter/material.dart';

import 'constant.dart';

InputDecoration familyName() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(8.00),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(8.00),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'HouseNameCommunityName',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration familyPhoneNumber() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Family_Phone_Number',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

BoxDecoration uploadPhoto() => BoxDecoration(
    border: Border.all(color: ColorConstant.textColor, width: 0.7),
    borderRadius: BorderRadius.circular(06));

InputDecoration drop(String label) => InputDecoration(
    labelText: label,
    labelStyle: FontConstant.inter.copyWith(fontSize: 12),
    border: const OutlineInputBorder(
        borderSide: BorderSide(
            width: 0.7,
            style: BorderStyle.solid,
            color: ColorConstant.textColor)));

InputDecoration pinCode() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label:
        Text('Postal_Code', style: FontConstant.inter.copyWith(fontSize: 12)));

InputDecoration address() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Address',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration member() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Head_of_the_Family',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration churchName() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Church_Name',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration occupation() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Occupation',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration phoneNumber() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Phone_Number',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration memberName() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Name',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration reasonName() => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      'Reason',
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));

InputDecoration textField(String label) => InputDecoration(
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorConstant.textColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorConstant.primaryColor, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: ColorConstant.textColor, width: 0.7)),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 0.7),
      borderRadius: BorderRadius.circular(08),
    ),
    label: Text(
      label,
      style: FontConstant.inter.copyWith(fontSize: 12),
    ));
