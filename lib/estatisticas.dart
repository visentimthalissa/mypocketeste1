import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'menuinferior.dart';

void main() {
  runApp(const EstatisticasScreen());
}

class EstatisticasScreen extends StatelessWidget {
  const EstatisticasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  const FinanceScreen({super.key});

  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final Map<String, double> _dataMap = {
    "Categoria 1": 40,
    "Categoria 2": 30,
    "Categoria 3": 30,
  };

  String _selectedCategory = "Categoria 1";
  final List<Goal> _goals = [
    Goal(name: "Meta 1", percentage: 0.7),
    Goal(name: "Meta 2", percentage: 0.5),
    Goal(name: "Meta 3", percentage: 0.2),
  ];

  Map<String, Color> _getChartColorMap() {
    final defaultColor = Colors.grey[300]!;
    const selectedColor = Colors.yellow;

    Map<String, Color> colorMap = {};
    for (var category in _dataMap.keys) {
      colorMap[category] =
          _selectedCategory == category ? selectedColor : defaultColor;
    }

    return colorMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20), // Espaço adicional para baixo
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text('Estatísticas:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  PieChart(
                    dataMap: _dataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartRadius: MediaQuery.of(context).size.width / 2.2,
                    chartType: ChartType.disc,
                    colorList: _getChartColorMap().values.toList(),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                    ),
                    legendOptions: const LegendOptions(
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
            const SizedBox(height: 20), // Espaço adicional para baixo
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Minhas metas:',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ..._goals.map((goal) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(goal.name, style: const TextStyle(fontSize: 18)),
                            LinearProgressIndicator(
                              value: goal.percentage,
                              backgroundColor: Colors.grey[200],
                              valueColor:
                                  const AlwaysStoppedAnimation<Color>(Colors.yellow),
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
      bottomNavigationBar: const BottomMenu(), // Adicionando o menu inferior
    );
  }
}
