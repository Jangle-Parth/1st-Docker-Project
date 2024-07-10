import 'package:flutter/material.dart';
import 'package:frontend/create.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  _buildCrudButton(
                    context: context,
                    icon: Icons.create,
                    label: "Create",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateScreen(),
                        ),
                      );
                    },
                  ),
                  _buildCrudButton(
                    context: context,
                    icon: Icons.read_more,
                    label: "Read",
                    onPressed: () {
                      // Add your Read functionality here
                    },
                  ),
                  _buildCrudButton(
                    context: context,
                    icon: Icons.update,
                    label: "Update",
                    onPressed: () {
                      // Add your Update functionality here
                    },
                  ),
                  _buildCrudButton(
                    context: context,
                    icon: Icons.delete,
                    label: "Delete",
                    onPressed: () {
                      // Add your Delete functionality here
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCrudButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
