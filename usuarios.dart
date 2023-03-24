import 'package:flutter/material.dart';

class User {
  final String name;
  final String appointmentInfo;

  User({required this.name, required this.appointmentInfo});
}

class UserScreen extends StatefulWidget {
  final List<User> users = [
    User(name: 'John Doe', appointmentInfo: '9:00 AM'),
    User(name: 'Jane Smith', appointmentInfo: '10:30 AM'),
    User(name: 'Bob Johnson', appointmentInfo: '11:15 AM'),
    User(name: 'Alice Williams', appointmentInfo: '2:00 PM'),
  ];

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User> filteredUsers = [];

  @override
  void initState() {
    super.initState();
    filteredUsers = widget.users;
  }

  void filterUsers(String query) {
    List<User> searchedUsers = widget.users.where((user) {
      final name = user.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return name.contains(searchLower);
    }).toList();

    setState(() {
      filteredUsers = searchedUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => filterUsers(value),
              decoration: InputDecoration(
                labelText: 'Buscador',
                hintText: 'Busca usuarios por nombre',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.appointmentInfo),
                  trailing: Text('Pendiente cita'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
