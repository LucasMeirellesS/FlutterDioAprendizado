import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController =
      TextEditingController(text: 'lucasmeirelles@dio.me');
  TextEditingController senhaController = TextEditingController(text: 'teste');

  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 10,
                    child: Image.network(
                      'https://th.bing.com/th/id/R.750660fac3ae761d5cc107fb0e6fc321?rik=UT4arhbplHrlVQ&pid=ImgRaw&r=0',
                      height: 150,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Ja tem cadastro?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Faça seu login e make the change",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purple.shade900,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Colors.white), // Cor da borda quando selecionado
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color:
                          Colors.white, // Cor do rótulo quando não está em foco
                    ),
                  ),
                  onChanged: (value) {
                    debugPrint(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: senhaController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: isObscureText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.purple.shade900,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      child: Icon(
                        isObscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.purple.shade900,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ), // Cor da borda quando selecionado
                    ),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      color:
                          Colors.white, // Cor do rótulo quando não está em foco
                    ),
                  ),
                  onChanged: (value) {
                    debugPrint(value);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
                    foregroundColor: Colors.white, // Defina a cor do texto aqui
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    debugPrint(emailController.text);
                    debugPrint(senhaController.text);
                    if (emailController.text.trim() ==
                            'lucasmeirelles@dio.me' &&
                        senhaController.text.trim() == 'teste') {
                      debugPrint("Login Efetuado com sucesso");
                      Navigator.pushReplacementNamed(context, '/app');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Erro ao efetuar o login"),
                      ));
                    }
                  },
                ),
              ),
              Expanded(child: Container()),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                child: const Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: const Text(
                  "Cadastro",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
