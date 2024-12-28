import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:uuid/uuid.dart';

class AddAccountModal extends StatefulWidget {
  const AddAccountModal({super.key});

  @override
  State<AddAccountModal> createState() => _AddAccountModalState();
}

class _AddAccountModalState extends State<AddAccountModal> {
  String _accountType = "AMBROSIA";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Nome",
              ),
            ),
            TextFormField(
              controller: _lastNameController,
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
                    onPressed: _isLoading ? null : _onButtonCancelClick,
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
                    onPressed: _onButtonSendClick,
                    child: _isLoading
                        ? SizedBox(height: 16, width: 16,
                          child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                        )
                        : const Text(
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

  _onButtonCancelClick() {
    if (!_isLoading) {
      Navigator.of(context).pop();
    }
  }

  _onButtonSendClick() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      String name = _nameController.text;
      String lastName = _lastNameController.text;

      Account account = Account(
        id: Uuid().v1(),
        name: name,
        lastName: lastName,
        balance: 0,
        accountType: _accountType,
      );

      await AccountService().addAccount(account);

      closeModal();
    }
  }

  closeModal() {
    Navigator.of(context).pop();
  }
}
