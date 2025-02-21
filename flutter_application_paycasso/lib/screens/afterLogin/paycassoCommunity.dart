import 'package:flutter/material.dart';
import 'package:flutter_application_paycasso/utils/bottomNavigationBar.dart';

class PaycassoCommunity extends StatefulWidget {
  const PaycassoCommunity({super.key});

  @override
  State<PaycassoCommunity> createState() => _PaycassoCommunityState();
}

class _PaycassoCommunityState extends State<PaycassoCommunity> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('This is community page')),
      //bottomNavigationBar: CustomNavigationBar(),
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
}