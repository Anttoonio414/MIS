import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
      home: const SubjectsList(),
    );
  }
}

class SubjectsList extends StatefulWidget {
  const SubjectsList({super.key});

  @override
  State<SubjectsList> createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  final List<String> _subjects = [];

  void addSubject(){
    showDialog(context: context, builder: (BuildContext context){
      String newSubject = "";
      return AlertDialog(
        title: const Text("Add a new Subject"),
        content: TextField(
          onChanged: (value){
            newSubject = value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                  if(newSubject.isNotEmpty){
                    _subjects.add(newSubject);
                  }
                  Navigator.pop(context);
                });
              },
              child: const Text("Add"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects List"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: _subjects.length,
          itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(_subjects[index], style: const TextStyle(fontSize: 18),),
              trailing: IconButton(icon: const Icon(Icons.delete_rounded), onPressed: () {
                setState(() {
                  _subjects.removeAt(index);
                });
                },
              ),
            ),
          );
          }),
      floatingActionButton: FloatingActionButton(onPressed: addSubject,
        backgroundColor: Colors.amberAccent,
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}


