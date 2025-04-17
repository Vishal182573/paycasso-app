import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_paycasso/utils/bottomNavigationBar.dart';
import 'package:flutter_application_paycasso/screens/afterLogin/profile/paymentMethods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_paycasso/providers/app_auth_provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 2; // Profile tab selected
  final String publicKey =
      "0xgeje1532hn"; // This will be replaced with your actual public key

  void _showProfileQR() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: Colors.grey[800]!,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Profile Public Key',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                // child: QrImageView(
                //   data: publicKey, // Using the public key for QR code
                //   version: QrVersions.auto,
                //   size: 200.w,
                //   backgroundColor: Colors.white,
                //   foregroundColor: Colors.black,
                // ),
              ),
              SizedBox(height: 16.h),
              // Display the public key below QR code
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  publicKey,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14.sp,
                    fontFamily: 'Monospace',
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Scan to connect',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleLogout() async {
    try {
      await context.read<AppAuthProvider>().logout();
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/onboarding',
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging out: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Confirm Logout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16.sp,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16.sp,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close dialog
                await _handleLogout();
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
                      GestureDetector(
                        onTap: _showProfileQR,
                        child: Container(
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
                  onPressed: _showLogoutConfirmation,
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
              if (title == 'Payment Methods') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentMethodsScreen(),
                  ),
                );
              }
              // Handle other menu items...
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
