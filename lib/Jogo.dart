import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  String _escolhaApp = "images/padrao.png";
  String _mensagemUsuario = "Escolha uma opção abaixo:";

  @override
  Widget build(BuildContext context) {

    var _tamanhoImagem = screenHeight(context, dividedBy: 6);

    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: Text("Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                ),),
            ),
            Image.asset(_escolhaApp),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 32),
              child: Text(_mensagemUsuario,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset("images/pedra.png", height: _tamanhoImagem),
                  onTap: () => SelecionarOpcao("pedra")
                ),
                GestureDetector(
                  child: Image.asset("images/papel.png", height: _tamanhoImagem),
                  onTap: () => SelecionarOpcao("papel")
                ),
                GestureDetector(
                  child: Image.asset("images/tesoura.png", height: _tamanhoImagem),
                  onTap: () => SelecionarOpcao("tesoura")
                ),
              ],
            )

          ],
        ),
      )
    );
  }

  void SelecionarOpcao(String opcaoUsuario){
    List<String> _opcoes = ["pedra", "tesoura", "papel"];
    String _opcaoMaquina = _opcoes[Random().nextInt(3)];

    setState((){
      _escolhaApp = "images/${_opcaoMaquina}.png";

      if(opcaoUsuario == _opcaoMaquina){
        _mensagemUsuario = "Empate!";
        return;
      }

      if((opcaoUsuario == "papel" && _opcaoMaquina == "tesoura") ||
         (opcaoUsuario == "tesoura" && _opcaoMaquina == "pedra") ||
         (opcaoUsuario == "pedra" && _opcaoMaquina == "papel")){
        _mensagemUsuario = "Você perdeu :(";
        return;
      }
        _mensagemUsuario = "Você venceu !";
    });

  }

}


Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  print(screenSize(context).height / dividedBy);
  return screenSize(context).height / dividedBy;
}
