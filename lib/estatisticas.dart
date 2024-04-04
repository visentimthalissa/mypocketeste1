import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'menuinferior.dart';

void main() {
  runApp(EstatisticasScreen());
}

class EstatisticasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FinanceScreen(),
    );
  }
}

class Goal {
  String name;
  double percentage;

  Goal({required this.name, required this.percentage});
}

class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  Map<String, double> _dataMap = {
    "Categoria 1": 40,
    "Categoria 2": 30,
    "Categoria 3": 30,
  };

  String _selectedCategory = "Categoria 1";
  List<Goal> _goals = [
    Goal(name: "Meta 1", percentage: 0.7),
    Goal(name: "Meta 2", percentage: 0.5),
    Goal(name: "Meta 3", percentage: 0.2),
  ];

  Map<String, Color> _getChartColorMap() {
    final defaultColor = Colors.grey[300]!;
    final selectedColor = Colors.yellow;

    Map<String, Color> colorMap = {};
    _dataMap.keys.forEach((category) {
      colorMap[category] =
          _selectedCategory == category ? selectedColor : defaultColor;
    });

    return colorMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20), // Espaço adicional para baixo
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('Estatísticas:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  PieChart(
                    dataMap: _dataMap,
                    animationDuration: Duration(milliseconds: 800),
                    chartRadius: MediaQuery.of(context).size.width / 2.2,
                    chartType: ChartType.disc,
                    colorList: _getChartColorMap().values.toList(),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                    ),
                    legendOptions: LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.right,
                    ),
                  ),
                  Wrap(
                    children: _dataMap.keys.map((String key) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ChoiceChip(
                          label: Text(key),
                          selected: _selectedCategory == key,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedCategory = key;
                            });
                          },
                          selectedColor: Colors.yellow,
                          backgroundColor: Colors.grey[200],
                          labelStyle: TextStyle(
                              color: _selectedCategory == key
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Espaço adicional para baixo
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Minhas metas:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ..._goals.map((goal) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(goal.name, style: TextStyle(fontSize: 18)),
                            LinearProgressIndicator(
                              value: goal.percentage,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.yellow),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomMenu(), // Adicionando o menu inferior
    );
  }
}
