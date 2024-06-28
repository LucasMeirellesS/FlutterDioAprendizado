import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagem_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';
import 'package:trilhaapp/shared/widgets/text_label2.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagemRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      var dropdown = DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
      );
      itens.add(dropdown);
    }
    return itens;
  }

  @override
  void initState() {
    linguagens = linguagemRepository.retornaLinguagens();
    niveis = nivelRepository.retornaNiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Meus Dados",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor da seta (back button)
        ),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextLabel(texto: "Nome"),
                  TextField(
                    controller: nomeController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const TextLabel(texto: "Data de Nascimento"),
                  TextField(
                    controller: dataNascimentoController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000, 1, 1),
                        firstDate: DateTime(1900, 5, 20),
                        lastDate: DateTime.now(),
                      );
                      if (data != null) {
                        dataNascimentoController.text =
                            "${data.year}-${data.month}-${data.day}";
                        dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nível de experiência"),
                  Column(
                    children: niveis
                        .map(
                          (nivel) => RadioListTile(
                            title: TextLabel2(texto: nivel),
                            selected: nivelSelecionado == nivel,
                            value: nivel,
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                nivelSelecionado = value.toString();
                              });
                            },
                          ),
                        )
                        .toList(),
                  ),
                  const TextLabel(texto: "Linguágens Preferidas"),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                              title: TextLabel2(texto: linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionadas.remove(linguagem);
                                  });
                                }
                              },
                            ))
                        .toList(),
                  ),
                  TextLabel(
                    texto: "Tempo de Experiência",
                  ),
                  DropdownButton(
                    dropdownColor: Colors.black,
                    value: tempoExperiencia,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    isExpanded: true,
                    items: returnItens(50),
                    onChanged: (value) {
                      setState(() {
                        tempoExperiencia = int.parse(value.toString());
                      });
                    },
                  ),
                  TextLabel(texto: "Pretenção Salarial"),
                  Slider(
                    min: 0,
                    max: 10000,
                    value: salarioEscolhido,
                    onChanged: (double value) {
                      setState(() {
                        salarioEscolhido = value;
                      });
                    },
                  ),
                  TextLabel(
                    texto:
                        "Pretenção Salarial. R\$ ${salarioEscolhido.toStringAsFixed(2)}",
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          salvando = false;
                        },
                      );
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("O nome deve ser preenchido"),
                          ),
                        );
                        return;
                      }
                      if (dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Data de nascimento inválida."),
                          ),
                        );
                        return;
                      }

                      if (nivelSelecionado == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Selecione seu nível de experiência!"),
                          ),
                        );
                        return;
                      }

                      if (linguagensSelecionadas.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Selecione pelo menos uma linguágem."),
                          ),
                        );
                        return;
                      }

                      if (linguagensSelecionadas.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Selecione uma linguágem."),
                          ),
                        );
                        return;
                      }

                      if (salarioEscolhido == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Salário escolhido tem que ser maior que zero."),
                          ),
                        );
                        return;
                      }

                      setState(
                        () {
                          salvando = true;
                        },
                      );

                      Future.delayed(
                        const Duration(seconds: 3),
                        () {
                          setState(
                            () {
                              salvando = false;
                            },
                          );
                          showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                backgroundColor: Colors.black,
                                title: TextLabel2(texto: "Sucesso"),
                                content: TextLabel2(
                                    texto: "Todos os dados foram salvos!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    child: const Text("Salvar"),
                  )
                ],
              ),
      ),
    );
  }
}
