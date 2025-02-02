import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../models/level_model.dart';

class LevelService {
  Future<List<Level>> getLevels() async {
    final String response = await rootBundle.loadString('assets/data/levels.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Level.fromJson(json)).toList();
  }

  Future<Level> getLevelById(int id) async {
    final List<Level> levels = await getLevels();
    return levels.firstWhere((level) => level.id == id);
  }
}