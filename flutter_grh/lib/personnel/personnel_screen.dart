import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/personnel.dart';
import 'providers/personnel_provider.dart';

class PersonnelScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _positionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PersonnelProvider()..loadPersonnel(),
      child: Scaffold(
        appBar: AppBar(title: Text('Gestion du Personnel')),
        body: Consumer<PersonnelProvider>(
          builder: (context, personnelProvider, child) {
            return ListView.builder(
              itemCount: personnelProvider.personnelList.length,
              itemBuilder: (context, index) {
                final personnel = personnelProvider.personnelList[index];
                return ListTile(
                  title: Text(personnel.name),
                  subtitle: Text(personnel.position),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Ajouter Personnel'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Nom'),
                    ),
                    TextField(
                      controller: _positionController,
                      decoration: InputDecoration(labelText: 'Poste'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () {
                      final personnel = Personnel(
                        id: 0,
                        name: _nameController.text,
                        position: _positionController.text,
                      );
                      Provider.of<PersonnelProvider>(context, listen: false)
                          .addPersonnel(personnel);
                      Navigator.of(context).pop();
                    },
                    child: Text('Ajouter'),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
