import 'package:calculadora/core/app_colors.dart';
import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String label;
  double largura;
  VoidCallback onClick;
  Color? background;
  Color? textColor;
  Botao(
      {Key? key,
      required this.label,
      required this.onClick,
      this.largura = 70,
      this.background,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Container(
          decoration: BoxDecoration(
              color: background ?? AppColors.corFundoBotao1,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(100)),
          width: largura,
          height: 70,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 25, color: textColor ?? AppColors.fontColor2),
            ),
          ),
        ),
      ),
    );
  }
}
