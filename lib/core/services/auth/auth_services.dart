import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:noviindus_interview/core/constants/functions/connection/connectivity_checker.dart';
import 'package:noviindus_interview/core/model/branch_list_model/branch_list_model.dart';
import 'package:noviindus_interview/core/model/login_model/login_model.dart';
import 'package:noviindus_interview/core/model/patient_list_model/patient_list_model.dart';
import 'package:noviindus_interview/core/model/treatment_list_model/treatment_list_model.dart';

class AuthServices {
  final ConnectivityChecker _connectivityChecker = ConnectivityChecker();

  Future<Either<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      // Check internet connectivity
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      // Make the POST request
      final response = await http.post(
        Uri.parse('https://flutter-amr.noviindus.in/api/Login'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
        },
        body: {
          'username': username,
          'password': password,
        },
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        print("sssssssssss");
        // // Assuming `LoginModel` has a `fromJson` method
        final loginModel = LoginModel.fromJson(data);
        print('User: ${loginModel.message}');
        return Right(data);
      } else {
        print('Login failed: ${response.body}');
        return Left('Failed to login: ${response.body}');
      }
    } catch (e) {
      print('Error during login: $e');
      return Left('Error: $e');
    }
  }

  Future<Either<String, List<PatientListModel>>> fetchPatientList() async {
    try {
      // Check internet connectivity
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      // Make the GET request
      final response = await http.get(
        Uri.parse('https://flutter-amr.noviindus.in/api/PatientList'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxODE4NTE1ODM5LCJpYXQiOjE3MzIxMTU4MzksImp0aSI6ImViODAwNTBmMjZjMjQ2NTY5NDI4ZDFmNjBjODQ1YWRkIiwidXNlcl9pZCI6MjF9.BvkjD8bhz8wgG5Ar5ijTj-dizeUP4WycgDCB2hqpwqE',
          'Accept': 'application/json',
        },
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        // Parse the branches list and convert to List<BranchListModel>
        if (data['patient'] != null) {
          List<PatientListModel> patientList = (data['patient'] as List)
              .map((patient) => PatientListModel.fromJson(patient))
              .toList();

          // Optionally, you can print the list for debugging
          patientList.forEach((patient) => print('patient: ${patient.name}'));

          return Right(patientList);
        } else {
          return Left('Branches data is missing');
        }
      } else {
        print('Branch list fetch failed: ${response.body}');
        return Left('Failed to fetch branch list: ${response.body}');
      }
    } catch (e) {
      print('Error during branch list fetch: $e');
      return Left('Error: $e');
    }
  }

  // Future<Either<String, dynamic>> registerPatient({
  //   required String token,
  //   required String name,
  //   required String executive,
  //   required String payment,
  //   required String phone,
  //   required String address,
  //   required double totalAmount,
  //   required double discountAmount,
  //   required double advanceAmount,
  //   required double balanceAmount,
  //   required String dateAndTime,
  //   required List<int> maleTreatments,
  //   required List<int> femaleTreatments,
  //   required String branch,
  //   required List<int> treatments,
  // }) async {
  //   try {
  //     // Check internet connectivity
  //     final hasInternet = await _connectivityChecker.hasInternetAccess();
  //     if (!hasInternet) {
  //       print("No internet connection");
  //       return const Left('No internet connection');
  //     }

  //     // Create the request body
  //     final body = {
  //       'name': name,
  //       'excecutive': executive,
  //       'payment': payment,
  //       'phone': phone,
  //       'address': address,
  //       'total_amount': 100.67,
  //       'discount_amount': 100.67,
  //       'advance_amount': 100.67,
  //       'balance_amount':100.67,
  //       'date_nd_time': dateAndTime,
  //       'id': '',
  //       'male':
  //           maleTreatments.join(','), // Convert list to comma-separated string
  //       'female': femaleTreatments.join(','),
  //       'branch': branch,
  //       'treatments': treatments.join(','),
  //     };

  //     // Make the POST request
  //     final response = await http.post(
  //       Uri.parse('https://flutter-amr.noviindus.in/api/PatientUpdate'),
  //       headers: {
  //         'Authorization':
  //             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxODE4NTE1ODM5LCJpYXQiOjE3MzIxMTU4MzksImp0aSI6ImViODAwNTBmMjZjMjQ2NTY5NDI4ZDFmNjBjODQ1YWRkIiwidXNlcl9pZCI6MjF9.BvkjD8bhz8wgG5Ar5ijTj-dizeUP4WycgDCB2hqpwqE',
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //         'Accept': 'application/json',
  //       },
  //       body: body,
  //     );

  //     // Handle response
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = json.decode(response.body);
  //       print(data.toString());
  //       if (data['status'] == true) {
  //         return Right(data['message']);
  //       } else {
  //         return Left(data['message'] ?? 'Failed to register patient');
  //       }
  //     } else {
  //       print('Patient registration failed: ${response.body}');
  //       return Left('Failed to register patient: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('Error during patient registration: $e');
  //     return Left('Error: $e');
  //   }
  // }

  Future<Either<String, List<BranchListModel>>> fetchBranchList() async {
    try {
      // Check internet connectivity
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      // Make the GET request
      final response = await http.get(
        Uri.parse('https://flutter-amr.noviindus.in/api/BranchList'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxODE4NTE1ODM5LCJpYXQiOjE3MzIxMTU4MzksImp0aSI6ImViODAwNTBmMjZjMjQ2NTY5NDI4ZDFmNjBjODQ1YWRkIiwidXNlcl9pZCI6MjF9.BvkjD8bhz8wgG5Ar5ijTj-dizeUP4WycgDCB2hqpwqE',
          'Accept': 'application/json',
        },
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        // Parse the branches list and convert to List<BranchListModel>
        if (data['branches'] != null) {
          List<BranchListModel> branchList = (data['branches'] as List)
              .map((branch) => BranchListModel.fromJson(branch))
              .toList();

          // Optionally, you can print the list for debugging
          branchList.forEach((branch) => print('Branch: ${branch.name}'));

          return Right(branchList);
        } else {
          return Left('Branches data is missing');
        }
      } else {
        print('Branch list fetch failed: ${response.body}');
        return Left('Failed to fetch branch list: ${response.body}');
      }
    } catch (e) {
      print('Error during branch list fetch: $e');
      return Left('Error: $e');
    }
  }

//---------------------------------------------------

  Future<Either<String, List<TreatmentListModel>>> fetchTreatmentList() async {
    try {
      // Check internet connectivity
      final hasInternet = await _connectivityChecker.hasInternetAccess();
      if (!hasInternet) {
        print("No internet connection");
        return const Left('No internet connection');
      }

      // Make the GET request
      final response = await http.get(
        Uri.parse('https://flutter-amr.noviindus.in/api/TreatmentList'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxODE4NTE1ODM5LCJpYXQiOjE3MzIxMTU4MzksImp0aSI6ImViODAwNTBmMjZjMjQ2NTY5NDI4ZDFmNjBjODQ1YWRkIiwidXNlcl9pZCI6MjF9.BvkjD8bhz8wgG5Ar5ijTj-dizeUP4WycgDCB2hqpwqE',
          'Accept': 'application/json',
        },
      );

      // Handle response
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);

        // Parse the branches list and convert to List<BranchListModel>
        if (data['treatments'] != null) {
          List<TreatmentListModel> treatmentsList = (data['treatments'] as List)
              .map((treatments) => TreatmentListModel.fromJson(treatments))
              .toList();

          // Optionally, you can print the list for debugging
          treatmentsList.forEach((treatments) => print('patient: ${treatments.name}'));

          return Right(treatmentsList);
        } else {
          return Left('Branches data is missing');
        }
      } else {
        print('Branch list fetch failed: ${response.body}');
        return Left('Failed to fetch branch list: ${response.body}');
      }
    } catch (e) {
      print('Error during branch list fetch: $e');
      return Left('Error: $e');
    }
  }
}
