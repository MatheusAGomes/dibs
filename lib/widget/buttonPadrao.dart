import 'package:flutter/material.dart';

import '../shared/service/colorService.dart';


class ButtonPadrao extends StatelessWidget {
  final String btnName;
  final VoidCallback click;
  final double height;
  final bool enable;
  final bool delete;
  const ButtonPadrao({
    super.key,
    required this.btnName,
    required this.click,
    this.height = 0.06,
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
          ? Container(
              height: MediaQuery.of(context).size.height * height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: this.delete ? Colors.red :  ColorService.azul,
                // ignore: prefer_const_constructors
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                child: Text(
                  btnName,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: MediaQuery.of(context).size.height *
                          0.021,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height * height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.grey,
                // ignore: prefer_const_constructors
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Center(
                child: Text(
                  btnName,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: MediaQuery.of(context).size.height *
                          0.021,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
    );
  }
}
