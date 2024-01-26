import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const SubjectsList(),
    );
  }
}

class SubjectsList extends StatefulWidget {
  const SubjectsList({Key? key});

  @override
  State<SubjectsList> createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  final List<String> _subjects = [];

  void addSubject() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newSubject = "";
        return AlertDialog(
          title: const Text(
            "Add a new Subject",
            style: TextStyle(color: Colors.blue),
          ),
          content: TextField(
            onChanged: (value) {
              newSubject = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newSubject.isNotEmpty) {
                    _subjects.add(newSubject);
                  }
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        );
      },
    );
  }
  void editSubject(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String updatedSubject = _subjects[index];
        return AlertDialog(
          title: const Text(
            "Edit Subject",
            style: TextStyle(color: Colors.blue),
          ),
          content: TextField(
            onChanged: (value) {
              updatedSubject = value;
            },
            controller: TextEditingController(text: _subjects[index]),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (updatedSubject.isNotEmpty) {
                    _subjects[index] = updatedSubject;
                  }
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        );
      },
    );
  }
  void deleteSubject(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Delete Confirmation",
            style: TextStyle(color: Colors.blue),
          ),
          content: const Text("Are you sure you want to delete this piece of clothing?",
              style: TextStyle(color: Colors.blue),
          ),

          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _subjects.removeAt(index);
                  Navigator.pop(context);
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                "No",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("181150"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _subjects.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                _subjects[index],
                style: const TextStyle(fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () {
                      deleteSubject(index); // Call the deleteSubject method
                    },
                    color: Colors.red,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      editSubject(index);
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addSubject,
        backgroundColor: Colors.green, // Green background for the button
        child: const Icon(Icons.add_box_outlined, color: Colors.red), // Red icon for the button
      ),
    );
  }
}
