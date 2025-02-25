import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/utils/bottomNavigationBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex =
      0; // Setting to 1 as Ethereum icon is selected in screenshot
  bool showAllSubscriptions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Points
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi James',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(
                          color: Colors.grey[800]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.diamond_outlined,
                            color: Colors.blue[300],
                            size: 16.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '500 PC', //Paycasso Coins
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                // Wallet Balance Card
                Container(
                  height: 210.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.r),
                    gradient: RadialGradient(
                      focalRadius: 100,
                      //focalPoint: Alignment.center,
                      radius: 1,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.grey.withOpacity(0.1),
                      ],
                    ),
                    border: Border.all(
                      width: 4,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Top row with wallet balance
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Wallet\nBalance',
                                      style: TextStyle(
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        height: 1.1,
                                      ),
                                    ),
                                    Text(
                                      '121.32 USDC',
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.purple
                                                  .withOpacity(0.3),
                                              blurRadius: 8,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            // Handle withdraw
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                            ),
                                          ),
                                          child: Text(
                                            'Deposit',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 21.w),
                                    Expanded(
                                      child: Container(
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[900],
                                          borderRadius:
                                              BorderRadius.circular(24.r),
                                          border: Border.all(
                                            color: Colors.grey[800]!,
                                            width: 1,
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            // Handle deposit
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                            ),
                                          ),
                                          child: Text(
                                            'Withdraw',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Subscriptions Section
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My subscriptions',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showAllSubscriptions = !showAllSubscriptions;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(50.w, 30.h),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.blue[300],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),

                // Subscription List
                buildSubscriptionItem(
                  'Figma',
                  'Due in 4 days',
                  '\$14.00',
                  Icons.grid_3x3,
                  hasDivider: true,
                ),
                buildSubscriptionItem(
                  'Canva',
                  'Bill Paid',
                  '\$6.99',
                  Icons.palette_outlined,
                  hasDivider: true,
                ),
                buildSubscriptionItem(
                  'Chatgpt',
                  'Due in a week',
                  '\$10.49',
                  Icons.all_inclusive,
                  hasDivider: false,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget buildSubscriptionItem(
    String title,
    String subtitle,
    String amount,
    IconData icon, {
    required bool hasDivider,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitle == 'Bill Paid'
                          ? Colors.grey[500]
                          : Colors.grey[400],
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        if (hasDivider)
          Column(
            children: [
              SizedBox(height: 25.h),
              Container(
                height: 0.8,
                color: Colors.grey[600]?.withOpacity(0.5),
              ),
              SizedBox(height: 25.h),
            ],
          ),
      ],
    );
  }
}