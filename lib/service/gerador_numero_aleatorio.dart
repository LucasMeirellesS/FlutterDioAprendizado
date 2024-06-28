import 'dart:math';

class GeradorNumeroAleatorioService {
  GeradorNumeroAleatorioService();

  static int gerarNumeroAleatorio(int numeroMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMaximo);
  }
}
