import 'package:dibs/shared/service/textStyle.dart';
import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';

class ButtonPadrao extends StatelessWidget {
  final String text;
  final VoidCallback click;
  final double height;
  final double width;
  final bool enable;
  final bool delete;
  const ButtonPadrao({
    super.key,
    required this.text,
    required this.click,
    this.height = 0.05,
    this.width = 0.5,
    this.enable = true,
    this.delete = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (enable) {
          click();
        }
      },
      child: enable
          ? Center(
            child: Container(
              height: MediaQuery.of(context).size.height * height,
              width: MediaQuery.of(context).size.width * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: delete ? ColorService.vermelho : ColorService.verde,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      color: Color(0xB37EF4D1),
                  ),
                ]
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyleService.defaultButton,
                ),
              ),
            )
          )
          : Center(
            child: Container(
              height: MediaQuery.of(context).size.height * height,
              width: MediaQuery.of(context).size.width * width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color(0xFF8B8B8B),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyleService.defaultButton,
                ),
              ),
            )
        )
    );
  }
}
