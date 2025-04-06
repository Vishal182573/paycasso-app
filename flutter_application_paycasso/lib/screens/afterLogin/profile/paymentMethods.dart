import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import 'package:country_picker/country_picker.dart';

class PaymentMethod {
  final String name;
  final IconData icon;
  final String? details;

  PaymentMethod({required this.name, required this.icon, this.details});
}

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  List<PaymentMethod> paymentMethods = [];
  String selectedCountry = 'US';
  String selectedCountryFlag = '🇺🇸';

  void _showAddPaymentDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      builder: (context) => PaymentOptionsSheet(
        onMethodSelected: (method) {
          setState(() {
            paymentMethods.add(method);
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryListTheme: CountryListThemeData(
        backgroundColor: Colors.black,
        textStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
        bottomSheetHeight: 500.h,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        inputDecoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          hintText: 'Search country',
          hintStyle: TextStyle(color: Colors.grey[400]),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[800]!),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country.countryCode;
          selectedCountryFlag = country.flagEmoji;
        });
      },
    );
  }

  void _deletePaymentMethod(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text(
          'Remove Payment Method',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to remove this payment method?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                paymentMethods.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPaymentDialog,
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black, size: 24.sp),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment Methods',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
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
                      SizedBox(width: 12.w),
                      GestureDetector(
                        onTap: _showCountryPicker,
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[800]!),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '$selectedCountryFlag $selectedCountry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: paymentMethods.isEmpty
                    ? Center(
                        child: Text(
                          'Add your payment methods',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: paymentMethods.length,
                        itemBuilder: (context, index) {
                          final method = paymentMethods[index];
                          return Dismissible(
                            key: ValueKey(method),
                            background: Container(
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 20.w),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 24.sp,
                              ),
                            ),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              _deletePaymentMethod(index);
                            },
                            child: _buildPaymentMethodTile(method, index),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(PaymentMethod method, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[800]!),
        gradient: LinearGradient(
          colors: [
            Colors.grey[900]!.withOpacity(0.5),
            Colors.grey[800]!.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Icon(method.icon, color: Colors.white, size: 24.sp),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (method.details != null)
                  Text(
                    method.details!,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red[300],
              size: 20.sp,
            ),
            onPressed: () => _deletePaymentMethod(index),
          ),
        ],
      ),
    );
  }
}

class PaymentOptionsSheet extends StatelessWidget {
  final Function(PaymentMethod) onMethodSelected;

  const PaymentOptionsSheet({super.key, required this.onMethodSelected});

  void _showDetailsDialog(BuildContext context, String type) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text('Add $type', style: const TextStyle(color: Colors.white)),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Enter $type details',
            hintStyle: TextStyle(color: Colors.grey[400]),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onMethodSelected(PaymentMethod(
                  name: type,
                  icon: _getIconForType(type),
                  details: controller.text,
                ));
                Navigator.pop(context);
              }
            },
            child: const Text('Add', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Apple Pay':
        return Icons.apple;
      case 'Cards':
        return Icons.credit_card;
      case 'Crypto Wallet':
        return Icons.currency_bitcoin;
      case 'Fiat Wallet':
        return Icons.account_balance_wallet;
      default:
        return Icons.payment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Methods',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Safe · Secured · Blockchain',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 32.h),
          _buildPaymentOptionButton(
              context, 'Apple Pay', 'Connect your Apple Pay Account'),
          SizedBox(height: 16.h),
          _buildPaymentOptionButton(
              context, 'Cards', 'Add your cards for easy transactions'),
          SizedBox(height: 16.h),
          _buildPaymentOptionButton(context, 'Crypto Wallet',
              'Add funds from any of your crypto wallet'),
          SizedBox(height: 16.h),
          _buildPaymentOptionButton(context, 'Fiat Wallet',
              'Pay from your fiat wallet for smooth flow'),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildPaymentOptionButton(
      BuildContext context, String title, String subtitle) {
    return GestureDetector(
      onTap: () => _showDetailsDialog(context, title),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey[800]!),
          gradient: LinearGradient(
            colors: [
              Colors.grey[900]!.withOpacity(0.5),
              Colors.grey[800]!.withOpacity(0.3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Icon(_getIconForType(title), color: Colors.white, size: 24.sp),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
