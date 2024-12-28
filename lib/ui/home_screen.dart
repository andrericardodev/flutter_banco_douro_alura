import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Account>> _futureGetAll = AccountService().getAll();

  Future<void> _refreshGetAll() async {
    setState(() {
      _futureGetAll = AccountService().getAll();
    });
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator(
            onRefresh: _refreshGetAll,
            child: FutureBuilder(
              future: _futureGetAll,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                    {
                      if (snapshot.data == null || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text("Nenhuma conta encontrada"),
                        );
                      } else {
                        List<Account> listAccounts = snapshot.data!;
                        return ListView.builder(
                          itemCount: listAccounts.length,
                          itemBuilder: (context, index) {
                            Account account = listAccounts[index];
                            return AccountWidget(account: account);
                          },
                        );
                      }
                    }
                }
              },
            ),
          )),
    );
  }
}
