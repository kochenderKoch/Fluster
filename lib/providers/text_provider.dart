import 'package:fluster/internal/database.dart';
import 'package:fluster/models/text.dart' as m_text;
import 'package:flutter/material.dart';

/// Provider for Text
class TextProvider extends ChangeNotifier {
  /// [TextProvider] Constructor
  TextProvider() {
    database = IsarDatabase();
    getTexts();
  }

  /// [IsarDatabase] Instance
  late IsarDatabase database;

  /// [List] of [Text]-Models
  List<m_text.Text> currentTexts = [];

  /// Add a new [Text] to the database and the provider
  Future<void> addText(m_text.Text text) async {
    await database.addText(text);
    currentTexts.add(text);
    notifyListeners();
  }

  /// Remove a [Text] from the database and the provider
  Future<void> removeText(m_text.Text text) async {
    await database.removeText(text);
    currentTexts.remove(text);
    notifyListeners();
  }

  /// Get all [Text]-Models from the [IsarDatabase] and set the [currentTexts]
  Future<void> getTexts() async {
    currentTexts = await database.getTexts();
    notifyListeners();
  }
}
