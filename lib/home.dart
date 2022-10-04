import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultado = "Escolha uma opção abaixo!";
  String primeiraOpcao = "padrao.png";
  @override
  void _jogar(int opcao) {
    List<String> escolhas = ["pedra.png", "papel.png", "tesoura.png"];
    int numeroAleatorio = Random().nextInt(3);
    setState(() {
      primeiraOpcao = escolhas[numeroAleatorio];
    });
    if (numeroAleatorio != opcao) {
     if ((opcao == 0 && numeroAleatorio == 2) ||
          (opcao == 1 && numeroAleatorio == 0) ||
          (opcao == 2 && numeroAleatorio == 1)) {
        setState(() {
          this.resultado = "Parabéns!! Você ganhou!!";
        });
      } else if ((opcao == 2 && numeroAleatorio == 0) ||
          (opcao == 0 && numeroAleatorio == 1) ||
          (opcao == 1 && numeroAleatorio == 2)){
        setState(() {
         this.resultado = "Infelizmente vc perdeu!!";
        });
      }
    } else{
       setState(() {
        this.resultado = "Empate!!";
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPO"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset("assets/$primeiraOpcao"),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                resultado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Image.asset(
                    "assets/pedra.png",
                    height: 100,
                  ),
                  onTap: () => _jogar(0),
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/papel.png",
                    height: 100,
                  ),
                  onTap: () => _jogar(1),
                ),
                GestureDetector(
                  child: Image.asset(
                    "assets/tesoura.png",
                    height: 100,
                  ),
                  onTap: () => _jogar(2),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
