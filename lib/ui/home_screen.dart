import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistema de Gestão de Contas"),
        backgroundColor: AppColors.bgAppBar,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
            tooltip: "Sair",
          ),
        ],
      ),
      body: Center(
        child: Text("Bem-vindo ao Banco D'Ouro'!"),
      ),
    );
  }
}
