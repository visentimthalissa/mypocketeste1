import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lembretes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReminderListPage();
  }
}

class ReminderList extends StatefulWidget {
  final Key key;

  ReminderList({required this.key}) : super(key: key);

  @override
  _ReminderListState createState() => _ReminderListState();

  static _ReminderListState of(BuildContext context) {
    return context.findAncestorStateOfType<_ReminderListState>()!;
  }
}

class _ReminderListState extends State<ReminderList> {
  List<String> reminders = [
    'Lembrete 1',
    'Lembrete 2',
    'Lembrete 3',
    'Lembrete 4'
  ];

  void addReminder(String newReminder) {
    setState(() {
      reminders.add(newReminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return ReminderTile(
          reminder: reminders[index],
          onEdit: (newReminder) {
            setState(() {
              reminders[index] = newReminder;
            });
          },
          onDelete: () {
            setState(() {
              reminders.removeAt(index);
            });
          },
        );
      },
    );
  }
}

class ReminderTile extends StatelessWidget {
  final String reminder;
  final Function(String) onEdit;
  final VoidCallback onDelete;

  ReminderTile({
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Lembrete:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  reminder,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  TextEditingController controller =
                      TextEditingController(text: reminder);
                  return AlertDialog(
                    title: Text('Editar Lembrete'),
                    content: TextField(
                      controller: controller,
                      onChanged: (newText) {},
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          onEdit(controller.text);
                          Navigator.pop(context);
                        },
                        child: Text('Salvar'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class ReminderListPage extends StatelessWidget {
  final _reminderListKey = GlobalKey<_ReminderListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lembretes'),
      ),
      body: ReminderList(key: _reminderListKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Abre o diálogo para adicionar um novo lembrete
          final newReminder = await showDialog<String>(
            context: context,
            builder: (context) => AddReminderDialog(),
          );

          if (newReminder != null && newReminder.isNotEmpty) {
            // Adiciona o novo lembrete à lista
            _reminderListKey.currentState!.addReminder(newReminder);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddReminderDialog extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Lembrete'),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(labelText: 'Novo Lembrete'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final newReminder = _controller.text;
            if (newReminder.isNotEmpty) {
              Navigator.pop(context, newReminder);
            }
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
