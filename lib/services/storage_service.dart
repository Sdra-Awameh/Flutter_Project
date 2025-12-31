import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';
import '../models/course.dart';

class StorageService {
  static const String userKey = 'user_data';
  static const String coursesKey = 'enrolled_courses';
  static const String isLoggedInKey = 'is_logged_in';
  static const String themeDarkModeKey = 'theme_dark_mode';
  static const String themePrimaryColorKey = 'theme_primary_color';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user.toJson()));
    await prefs.setBool(isLoggedInKey, true);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(userKey);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  Future<void> saveEnrolledCourses(List<Course> courses) async {
    final prefs = await SharedPreferences.getInstance();
    final coursesJson = courses.map((c) => c.toJson()).toList();
    await prefs.setString(coursesKey, jsonEncode(coursesJson));
  }

  Future<List<Course>> getEnrolledCourses() async {
    final prefs = await SharedPreferences.getInstance();
    final coursesJson = prefs.getString(coursesKey);
    if (coursesJson != null) {
      final List<dynamic> decoded = jsonDecode(coursesJson);
      return decoded.map((c) => Course.fromJson(c)).toList();
    }
    return [];
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Theme preferences
  Future<bool> getThemeDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeDarkModeKey) ?? false;
  }

  Future<void> setThemeDarkMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeDarkModeKey, isDarkMode);
  }

  Future<int> getThemePrimaryColor() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(themePrimaryColorKey) ?? 0xFF8B1538;
  }

  Future<void> setThemePrimaryColor(int colorValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themePrimaryColorKey, colorValue);
  }
}