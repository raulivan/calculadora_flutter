import 'package:calculadora/core/app_colors.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final TextEditingController controller;
  const Display({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 5,
        color: AppColors.corDeFundoTela,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: TextField(
            enabled: false,
            controller: this.controller,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 38, color: AppColors.fontColor),
            maxLines: 2,
            decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: AppColors.corDeFundoTela),
          ),
        ),
      ),
    );
  }
}
