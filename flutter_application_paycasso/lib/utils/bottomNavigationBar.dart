import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_paycasso/routes.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 37.w, vertical: 16.h),
      height: 70.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(121, 28, 28, 28),
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            index: 0,
            iconPath: 'assets/icons/home.svg',
            label: 'Home',
            route: AppRoutes.home,
          ),
          // _buildNavItem(
          //   index: 1,
          //   iconPath: 'assets/icons/explore.svg',
          //   label: 'Community',
          //   route: AppRoutes.paycassoCommunity,
          // ),
          _buildNavItem(
            index: 1,
            iconPath: 'assets/icons/profile.svg',
            label: 'Profile',
            route: AppRoutes.profile, // Update with profile route when available
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconPath,
    required String label,
    required String route,
  }) {
    final isSelected = widget.currentIndex == index;
    return GestureDetector(
      onTap: () {
        widget.onIndexChanged(index);
        if (widget.currentIndex != index) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Container(
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(35.r),
        ),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(
            //   icon,
            //   color: isSelected ? Colors.black : Colors.grey[600],
            //   size: 24.sp,
            // ),
            SvgPicture.asset(
              iconPath,
              width: index == 1 ? 32.w : 24.w,
              height: index == 1 ? 32.w : 24.w,
              
              // colorFilter: ColorFilter.mode(
              //   isSelected ? Colors.black : Colors.grey[600]!,
              //   BlendMode.srcIn,
              // ),
              color: isSelected ? Colors.black : Colors.grey[600],
            ),
            if (isSelected) ...[
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
