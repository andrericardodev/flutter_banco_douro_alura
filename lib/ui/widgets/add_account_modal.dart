import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width - 16,
      padding: EdgeInsets.only(
        top: 0,
        left: 32,
        right: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            SizedBox(height: 32),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Tipo de conta"),
                DropdownButton<String>(
                  value: _accountType,
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      value: "AMBROSIA",
                      child: Text("Ambrosia"),
                    ),
                    DropdownMenuItem(
                      value: "CANJICA",
                      child: Text("Canjica"),
                    ),
                    DropdownMenuItem(
                      value: "PUDIM",
                      child: Text("Pudim"),
                    ),
                    DropdownMenuItem(
                      value: "BRIGADEIRO",
                      child: Text("Brigadeiro"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _accountType = value;
                      });
                    }
                  },
                ),
              ],
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
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primary),
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
      ),
    );
  }
}
