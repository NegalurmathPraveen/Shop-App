import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(20.w),
        ),
        margin: EdgeInsets.symmetric(vertical: 20.h),
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'A Summer Surprise',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.h,
              ),
            ),
            5.verticalSpace,
            Text(
              'Cashback 20%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.h,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
