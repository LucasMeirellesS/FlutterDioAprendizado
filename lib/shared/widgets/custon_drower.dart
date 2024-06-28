import 'package:flutter/material.dart';

class CustonDrower extends StatelessWidget {
  const CustonDrower({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 77, 9, 119),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Lucas Meirelles"),
            accountEmail: Text("lucasmeirelles@dio.me"),
          ),
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
    );
  }
}
