import 'package:flutter/material.dart';
import 'package:shimmer_border_container/shimmer_border_container.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Color(0xFF0F1113),
      body: Center(
        child: ShimmerBorderContainer(
          width: 280,
          height: 70,
          borderRadius: 12,
          borderWidth: 1.0,
          shimmerDuration: Duration(seconds: 1),
          shimmerColor: Colors.white,
          child: Text(
            'Join Community',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    ),
  ));
}
