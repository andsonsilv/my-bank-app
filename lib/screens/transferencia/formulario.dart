import 'package:flutter/material.dart';
import 'package:untitled/components/editor.dart';
import 'package:untitled/models/transferencia.dart';

class FormularioTransferencia extends StatelessWidget {
  static const _tituloAppBar = 'Criando transferência';
  static const _rotuloCampoValor = 'Valor';
  static const _dicaCampoValor = '0.00';
  static const _rotuloCampoNumeroConta = 'Número da conta';
  static const _dicaCampoNumeroConta = '0000';
  static const _textoBotaoConfirmar = 'Confirmar';

  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampoValor,
                icone: Icons.monetization_on_outlined),
            ElevatedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text) != null
        ? int.parse(_controladorCampoNumeroConta.text)
        : -1;
    final double valor = double.tryParse(_controladorCampoValor.text) != null
        ? double.parse(_controladorCampoValor.text)
        : -1;

    if (numeroConta != -1 && valor != -1.0) {
      final transferenciaCriada = Transferencia(numeroConta, valor);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}