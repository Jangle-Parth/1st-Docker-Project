import 'package:flutter/material.dart';
import 'package:frontend/services/api.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _divController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _rollNoController.dispose();
    _divController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App"),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.blue],
          ),
        ),
        child: Center(
          child: Container(
            height: 500,
            width: 500,
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: _rollNoController,
                    decoration: const InputDecoration(
                      labelText: 'Roll No',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: _divController,
                    decoration: const InputDecoration(
                      labelText: 'Division',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var data = {
                        "name": _nameController.text,
                        "rollno": _rollNoController.text,
                        "division": _divController.text,
                      };
                      Api.addStudent(data);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateScreen(),
                        ),
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
