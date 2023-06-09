import 'dart:math';
import 'package:get/get.dart';

const guidelineBaseWidth = 428;
const guidelineBaseHeight = 926;

double get screenWidth => Get.width; //1800
double get screenHeight => Get.height; //2560

double get scaleWidth => screenWidth / guidelineBaseWidth;
double get scaleHeight => screenHeight / guidelineBaseHeight;

double get scaleText => min(scaleWidth, scaleHeight);

extension ScreenExtension on num {
  double get w => this * scaleWidth; // Width Scale
  double get h => this * scaleHeight; // Height Scale
  double get sp => this * scaleText; // Text Scale
  double get r => this * scaleText; // Radius Scale
}
