import 'package:fluster/internal/database.dart';
import 'package:fluster/models/text.dart' as m_text;
import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  late IsarDatabase database;
  TextProvider() {
    database = IsarDatabase();
    getTexts();
  }

  List<m_text.Text> currentTexts = [];

  void addText(m_text.Text text) {
    database.addText(text);
    currentTexts.add(text);
    notifyListeners();
  }

  void removeText(m_text.Text text) async {
    database.removeText(text);
    currentTexts.remove(text);
    notifyListeners();
  }

  void getTexts() async {
    currentTexts = await database.getTexts();
    notifyListeners();
  }
}
