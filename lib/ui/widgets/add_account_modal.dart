import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class AddAccountModal extends StatelessWidget {
  const AddAccountModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width - 16,
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          Image.asset(
            "assets/images/icon_add_account.png",
            height: 64,
          ),
          Text(
            "Adicionar nova conta",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Preencha os dados abaixo:",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Nome",
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Último nome",
            ),
          ),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
