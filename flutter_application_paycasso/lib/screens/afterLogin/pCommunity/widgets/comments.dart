import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentButton extends StatelessWidget {
  final String commentCount;
  final VoidCallback onTap;

  const CommentButton({
    super.key,
    required this.commentCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65.w,
        height: 32.h,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12.w,
              top: 0,
              bottom: 0,
              child: Center(
                // child: Icon(
                //   Icons.chat_bubble_outline,
                //   color: Colors.white,
                //   size: 22.sp,
                // ),
                child: SvgPicture.asset(
                  'assets/icons/comments.svg',
                  width: 22.w,
                  height: 22.w,
                  color: Colors.white,
                )
              ),
            ),
            Positioned(
              right: 8.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  commentCount,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
