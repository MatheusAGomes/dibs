import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowedCard extends StatelessWidget {
  Widget? child;

  ShadowedCard({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0x40000000)),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
                color: Color(0x40000000),
                offset: Offset(2,2),
                blurRadius: 0.2
            )
          ]
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        color: Colors.white,
        child: this.child
      ),
    );
  }
}