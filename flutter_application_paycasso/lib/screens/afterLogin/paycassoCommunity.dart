import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/utils/bottomNavigationBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'pCommunity/widgets/like.dart';
import 'pCommunity/widgets/comments.dart';
import 'pCommunity/widgets/share.dart';

class PaycassoCommunity extends StatefulWidget {
  const PaycassoCommunity({super.key});

  @override
  State<PaycassoCommunity> createState() => _PaycassoCommunityState();
}

class _PaycassoCommunityState extends State<PaycassoCommunity> {
  final List<String> categories = [
    'All',
    'Figma',
    'Canva',
    'Spotify',
    'Creatr'
  ];
  String selectedCategory = 'All';
  int _currentIndex = 1; // Set to 1 since this is the community page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20.r,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Paycasso Community',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.diamond_outlined,
                            color: Colors.blue[200], size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '900 PC',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Categories horizontal list
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedCategory = category),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: selectedCategory == category
                              ? Colors.grey[800]
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey[800]!),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            // Posts list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return _buildPost(
                    businessName: index == 0 ? 'Spotify' : 'Figma',
                    verifiedBusiness: true,
                    time: '18m',
                    content: index == 0
                        ? 'Excid to launch this new feature ✨ Check it out! #spotify #feedback'
                        : 'Features wanted in version 2.2 of figma!',
                    imageUrl: index == 0
                        ? 'assets/images/spotify.png'
                        : 'assets/images/figma.png',
                    likes: index == 0 ? '221' : '114',
                    comments: index == 0 ? '5' : '12',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPost({
    required String businessName,
    required bool verifiedBusiness,
    required String time,
    required String content,
    required String imageUrl,
    required String likes,
    required String comments,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16.r,
                backgroundImage: AssetImage('assets/images/business_logo.png'),
              ),
              SizedBox(width: 8.w),
              Text(
                businessName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.w),
              if (verifiedBusiness)
                Icon(
                  Icons.verified,
                  color: Colors.blue[200],
                  size: 14.sp,
                ),
              SizedBox(width: 8.w),
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              LikeButton(likeCount: likes),
              SizedBox(width: 8.w),
              CommentButton(
                commentCount: comments,
                onTap: () {
                  // Add your comment section navigation logic here
                },
              ),
              Spacer(),
              ShareButton(
                onTap: () {
                  // Add your share logic here
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
