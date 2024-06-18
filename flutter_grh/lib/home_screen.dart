import 'package:flutter/material.dart';
import 'personnel/personnel_screen.dart';
import 'conges/conges_screen.dart';
import 'salaires/salaires_screen.dart';
import 'performances/performances_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gestion RH')),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildGridItem(
              context,
              'Gestion du Personnel',
              Icons.people,
              PersonnelScreen(),
            ),
            _buildGridItem(
              context,
              'Gestion des Congés',
              Icons.event,
              CongesScreen(),
            ),
            _buildGridItem(
              context,
              'Gestion des Salaires',
              Icons.monetization_on,
              SalairesScreen(),
            ),
            _buildGridItem(
              context,
              'Gestion des Performances',
              Icons.assessment,
              PerformancesScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 20),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
