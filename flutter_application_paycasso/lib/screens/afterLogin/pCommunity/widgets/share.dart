import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onTap;

  const ShareButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        
        child: SvgPicture.asset(
          'assets/icons/share.svg',
          width: 16.w,
          height: 16.h,
          color: Colors.white,
        ),
      ),
    );
  }
}
