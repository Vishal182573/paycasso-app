import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeButton extends StatefulWidget {
  final String likeCount;
  const LikeButton({super.key, required this.likeCount});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
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
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                  size: 22.sp,
                ),
              ),
            ),
            Positioned(
              right: 8.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  widget.likeCount,
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
