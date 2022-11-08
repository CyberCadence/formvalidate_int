import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';


// ignore_for_file: public_member_api_docs, sort_constructors_first
class FormModel {
  String? id;

  final int empId;

  final String lastName;
  final String firstName;
  final double dob;
  final String email;
  final int mobile;

  final String department;
  final String designation;
  final double salary;
  FormModel({
    this.id,
    required this.empId,
    required this.lastName,
    required this.firstName,
    required this.dob,
    required this.email,
    required this.mobile,
    required this.department,
    required this.designation,
    required this.salary,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'empId': empId,
      'lastName': lastName,
      'firstName': firstName,
      'dob': dob,
      'email': email,
      'mobile': mobile,
      'department': department,
      'designation': designation,
      'salary': salary,
    };
  }

  factory FormModel.fromMap(DocumentSnapshot map) {
    return FormModel(
      id: map.id,
      empId: map['empId'] as int,
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      dob: map['dob'] as double,
      email: map['email'] as String,
      mobile: map['mobile'] as int,
      department: map['department'] as String,
      designation: map['designation'] as String,
      salary: map['salary'] as double,
    );
  }
}
