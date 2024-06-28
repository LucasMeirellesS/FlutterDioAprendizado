import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';
import 'pagina1.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Main Page',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.purple.shade900,
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 77, 9, 119),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // DrawerHeader(
              //   child: Text(
              //     'Menu',
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.purple.shade900,
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: ListTile(
                  title: Text(
                    'Dados Cadastrais',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cdados');
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: ListTile(
                  title: Text(
                    'Termos de uso e privacidade',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: ListTile(
                  title: Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: ListTile(
                  title: Text(
                    'Sair',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: [
                BottomNavigationBarItem(
                  label: "Pg1",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Pg2",
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  label: "Pg3",
                  icon: Icon(Icons.person),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
