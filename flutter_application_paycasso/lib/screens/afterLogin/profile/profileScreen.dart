import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_paycasso/utils/bottomNavigationBar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 2; // Profile tab selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              children: [
                // Profile Image and Username
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[800]!,
                            width: 2,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        '@james',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),

                // Menu Items
                _buildMenuItem(
                  'Payment Methods',
                  'Check your added payment methods',
                  Icons.credit_card,
                ),
                _buildMenuItem(
                  'Social media integrations',
                  'View all your social media analytics',
                  Icons.public,
                ),
                _buildMenuItem(
                  'User Analytics',
                  'Check your added payment methods',
                  Icons.analytics,
                ),
                _buildMenuItem(
                  'Integrate your CRM',
                  'Check your added payment methods',
                  Icons.integration_instructions,
                ),
                _buildMenuItem(
                  'Invoices',
                  'Check your added payment methods',
                  Icons.receipt_long,
                ),
                _buildMenuItem(
                  'Paycasso AI',
                  'Check your added payment methods',
                  Icons.smart_toy,
                ),
                _buildMenuItem(
                  'Edit Profile',
                  'Check your added payment methods',
                  Icons.edit,
                ),
                _buildMenuItem(
                  'Paycasso Coins',
                  'Check your added payment methods',
                  Icons.monetization_on,
                ),

                // Logout Button
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    // Handle logout
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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

  Widget _buildMenuItem(String title, String subtitle, IconData icon) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: InkWell(
            onTap: () {
              // Handle menu item tap
            },
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.w,
                  
                  child: Icon(
                    icon,
                    color: Colors.grey[400],
                    size: 30.sp,
                  ),
                ),
                SizedBox(width: 23.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Color(0xff6B6B6B),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[900], 
        ),
      ],
    );
  }
}
