import 'package:flutter/material.dart';
import '../models/personnel.dart';
import 'database_provider.dart';

class PersonnelProvider with ChangeNotifier {
  List<Personnel> _personnelList = [];

  List<Personnel> get personnelList => _personnelList;

  Future<void> loadPersonnel() async {
    _personnelList = await DatabaseProvider().fetchAllPersonnel();
    notifyListeners();
  }

  Future<void> addPersonnel(Personnel personnel) async {
    await DatabaseProvider().insertPersonnel(personnel);
    await loadPersonnel();
  }
}
