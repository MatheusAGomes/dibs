import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../shared/routes/routes.dart';

class ShadowedDropDown extends StatelessWidget{
  DropdownButton? child;

  ShadowedDropDown({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.055,
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    color: Color(0x33000000)
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(2,2),
                      blurRadius: 0.3
                  )
                ]
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                MediaQuery.of(Routes.navigatorKey.currentContext!).size.width *
                    0.03,
                vertical: 0,
              ),
              child: child
            )
        )
    );
  }

}