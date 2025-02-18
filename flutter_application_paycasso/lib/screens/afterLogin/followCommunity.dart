import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FollowCommunity extends StatefulWidget {
  const FollowCommunity({super.key});

  @override
  State<FollowCommunity> createState() => _FollowCommunityState();
}

class _FollowCommunityState extends State<FollowCommunity> {
  final Set<String> selectedButtons = {};
  Set<String> selectedItems = {}; // Track selected items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // continue button
      floatingActionButton: selectedItems.isNotEmpty
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              width: double.infinity,
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () {
                  // Add your navigation logic here
                },
                label: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 50.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Follow your vibe',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 35.h),
              // Grid View
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 26.h,
                  crossAxisSpacing: 40.w,
                  childAspectRatio: 3.0,
                  children: [
                    for (String text in [
                      'Figma Canva',
                      'Canva',
                      'Spotify',
                      'Creatr',
                      'Iconax',
                      'Twitter',
                      'Crisp',
                      'Getx',
                      'Groww',
                      'Shopify',
                      'X',
                      'Snap',
                      'Fansly',
                      'Blinkit',
                      'Zepto',
                      'Swiggy',
                    ])
                      _buildSaasButton(text),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              
            ],
          ),
        ),
      ),
    );
  }

  // SaaS Button
  Widget _buildSaasButton(String text) {
    final bool isSelected = selectedButtons.contains(text);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedButtons.remove(text);
            selectedItems.remove(text);
          } else {
            selectedButtons.add(text);
            selectedItems.add(text);
          }
        });
      },
      child: Container(
        height: 50.h,
        width: 151.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: const AssetImage('assets/images/Card.png'),
            fit: BoxFit.fill,
            opacity: 0.7,
          ),
          border:
              isSelected ? Border.all(color: const Color.fromARGB(176, 255, 255, 255), width: 2.w) : null,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              Icon(Icons.flag, color: Colors.white, size: 22.sp),
              
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    overflow: TextOverflow.clip,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 22.w), // To balance the icon on the left
            ],
          ),
        ),
      ),
    );
  }

}
