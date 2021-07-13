import 'package:calculadora/core/app_colors.dart';
import 'package:calculadora/shared/botao/index.dart';
import 'package:calculadora/shared/display/index.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _displayController = new TextEditingController();
  var _apagar = '';
  @override
  void initState() {
    super.initState();
    _displayController.text = "0";

    Runes input = new Runes(' \u{21e4} ');
    _apagar = new String.fromCharCodes(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.corDeFundoTela,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          children: [
            Display(controller: _displayController),
            //Primeira linha
            Row(
              children: [
                Botao(
                  label: 'AC',
                  background: AppColors.corFundoBotao1,
                  onClick: () {
                    _displayController.text = '0';
                  },
                ),
                Botao(
                  label: '+/-',
                  background: AppColors.corFundoBotao1,
                  onClick: () {
                    var operadores = _displayController.text.split(' ');
                    var posicao = operadores.length - 1;
                    if (operadores[posicao].indexOf('-') != -1) {
                      operadores[posicao] =
                          operadores[posicao].replaceFirst('-', '');
                    } else {
                      operadores[posicao] = '-' + operadores[posicao];
                    }
                    _displayController.text = operadores.join();
                  },
                ),
                Botao(
                  label: _apagar,
                  background: AppColors.corFundoBotao1,
                  onClick: () {
                    if (_displayController.text.length > 0)
                      _displayController.text = _displayController.text
                          .substring(0, _displayController.text.length - 1);
                  },
                ),
                Botao(
                    label: '÷',
                    background: AppColors.corFundoBotao3,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += ' / ';
                    })
              ],
            ),
            Row(
              children: [
                Botao(
                  label: '7',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '7';
                  },
                ),
                Botao(
                  label: '8',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '8';
                  },
                ),
                Botao(
                    label: '9',
                    background: AppColors.corFundoBotao2,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += '8';
                    }),
                Botao(
                    label: 'X',
                    background: AppColors.corFundoBotao3,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += ' * ';
                    })
              ],
            ),
            //Segunda linha
            Row(
              children: [
                Botao(
                  label: '4',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '4';
                  },
                ),
                Botao(
                  label: '5',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '5';
                  },
                ),
                Botao(
                    label: '6',
                    background: AppColors.corFundoBotao2,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += '6';
                    }),
                Botao(
                    label: '-',
                    background: AppColors.corFundoBotao3,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += ' - ';
                    })
              ],
            ),
            //Terceira linha
            Row(
              children: [
                Botao(
                  label: '1',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '1';
                  },
                ),
                Botao(
                  label: '2',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '2';
                  },
                ),
                Botao(
                    label: '3',
                    background: AppColors.corFundoBotao2,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += '3';
                    }),
                Botao(
                    label: '+',
                    background: AppColors.corFundoBotao3,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      _displayController.text += ' + ';
                    })
              ],
            ),
            //Quarta linha
            Row(
              children: [
                Botao(
                  largura: 150,
                  label: '0',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '0';
                  },
                ),
                Botao(
                  label: ',',
                  background: AppColors.corFundoBotao2,
                  textColor: AppColors.fontColor,
                  onClick: () {
                    _displayController.text += '.';
                  },
                ),
                Botao(
                    label: '=',
                    background: AppColors.corFundoBotao3,
                    textColor: AppColors.fontColor,
                    onClick: () {
                      try {
                        var parser = new Parser();
                        Expression exp = parser.parse(_displayController.text);
                        var contextModel = ContextModel();
                        double result =
                            exp.evaluate(EvaluationType.REAL, contextModel);

                        _displayController.text = result.toStringAsFixed(2);
                      } catch (e) {
                        _displayController.text = e.toString();
                      }
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
