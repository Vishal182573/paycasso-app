import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/utils/bottomNavigationBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex =
      0; // Setting to 1 as Ethereum icon is selected in screenshot
  bool showAllSubscriptions = false;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // QRViewController? controller;

  final List<Map<String, String>> subscriptionItems = [
    {
      'title': 'Figma',
      'subtitle': 'Due in 4 days',
      'amount': '\$14.00',
      'logo': 'assets/icons/figma_logo.png',
    },
    {
      'title': 'Canva',
      'subtitle': 'Bill Paid',
      'amount': '\$6.99',
      'logo': 'assets/icons/canva_logo.png',
    },
    {
      'title': 'Chatgpt',
      'subtitle': 'Due in a week',
      'amount': '\$10.49',
      'logo': 'assets/icons/chatgpt_logo.png',
    },
    {
      'title': 'Figma',
      'subtitle': 'Due in 4 days',
      'amount': '\$14.00',
      'logo': 'assets/icons/figma_logo.png',
    },
    {
      'title': 'Canva',
      'subtitle': 'Bill Paid',
      'amount': '\$6.99',
      'logo': 'assets/icons/canva_logo.png',
    },
    {
      'title': 'Chatgpt',
      'subtitle': 'Due in a week',
      'amount': '\$10.49',
      'logo': 'assets/icons/chatgpt_logo.png',
    },
  ];

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     if (scanData.code != null) {
  //       controller.pauseCamera();
  //       Navigator.pop(context, scanData.code);
  //     }
  //   });
  // }

  // void _showQRScanner() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => Container(
  //       height: MediaQuery.of(context).size.height,
  //       child: Stack(
  //         children: [
  //           QRView(
  //             key: qrKey,
  //             onQRViewCreated: _onQRViewCreated,
  //             overlay: QrScannerOverlayShape(
  //               borderColor: Colors.white,
  //               borderRadius: 10,
  //               borderLength: 30,
  //               borderWidth: 10,
  //               cutOutSize: 300,
  //             ),
  //           ),
  //           Positioned(
  //             top: 40.h,
  //             left: 16.w,
  //             child: IconButton(
  //               icon: const Icon(Icons.close, color: Colors.white),
  //               onPressed: () => Navigator.pop(context),
  //             ),
  //           ),
  //           Positioned(
  //             bottom: 100.h,
  //             left: 0,
  //             right: 0,
  //             child: Center(
  //               child: Text(
  //                 'Scan QR Code',
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 18.sp,
  //                   fontWeight: FontWeight.w500,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   ).then((value) {
  //     if (value != null) {
  //       // Handle the scanned QR code result
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('QR Code scanned: $value'),
  //           backgroundColor: Colors.grey[900],
  //         ),
  //       );
  //     }
  //   });
  // }

  @override
  void dispose() {
    //controller?.dispose();
    super.dispose();
  }

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
                    GestureDetector(
                      // onTap: _showQRScanner,
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[800]!),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.qr_code_scanner,
                          color: Colors.white,
                          size: 20.sp,
                        ),
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
                        Colors.white.withOpacity(0.4),
                        Colors.black.withOpacity(0.9),
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
                      'Transaction History',
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
                _buildSubscriptionItem(
                  'Figma',
                  'xa2334edhui9987tggjjvbn',
                  '14.00',
                  'assets/icons/figma_logo.png',
                  hasDivider: true,
                ),
                _buildSubscriptionItem(
                  'Canva',
                  'a45d3hko97ygcswe5ccbou',
                  '6.99',
                  'assets/icons/canva_logo.png',
                  hasDivider: true,
                ),
                _buildSubscriptionItem(
                  'Chatgpt',
                  'ss3535tggfds332adf533aw',
                  '10.49',
                  'assets/icons/chatgpt_logo.png',
                  hasDivider: false,
                ),
              ],
            ),
          ),
        ),
      ),
      // extendBody: true,
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

  Widget _buildSubscriptionItem(
      String title, String subtitle, String amount, String logoPath,
      {required bool hasDivider}) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16.r),
              ),
              // child: Center(
              //   child: Container(
              //     width: 32.w,
              //     height: 32.w,
              //     decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.1),
              //       shape: BoxShape.circle,
              //     ),
              child: Center(
                child: Image.asset(
                  logoPath,
                  width: 40.w,
                  height: 40.w,
                ),
              ),
              //),
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
