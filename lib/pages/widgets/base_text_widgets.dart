import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

Widget reusableText(
  String text, {
  Color color = AppColors.primaryText,
  FontWeight weight = FontWeight.bold,
  double size = 16,
  TextAlign textAlign = TextAlign.start,
  int maxLines = 99,
}) {
  return Container(
    child: Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.fade,
      textAlign: textAlign,
      softWrap: false,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size.sp,
      ),
    ),
  );
}
