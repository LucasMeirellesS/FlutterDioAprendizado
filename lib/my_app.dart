import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

import 'pages/main_page.dart';
import 'pages/login_page.dart';
// import 'pages/dados_cadastrais.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // vai rodar o meu aplicativo
      debugShowCheckedModeBanner: false, //não mostrar que o está fazendo debug
      theme: ThemeData(
        // tema padrão a aplicação
        textTheme: GoogleFonts.robotoSlabTextTheme(
          Theme.of(context).textTheme.apply(),
        ),

        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(), // Página inicial
        '/app': (context) => const MainPage(), // Outra página
        '/cdados': (context) => const DadosCadastraisPage(),
      },
    );
  }
}
