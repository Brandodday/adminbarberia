import 'package:flutter/material.dart';

class CitaCard extends StatelessWidget {
  final String imageUrl;
  final String nombre;

  const CitaCard({
    Key? key,
    required this.imageUrl,
    required this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: double.infinity,
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(width: 8.0),
                Text(nombre),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8.0),
              width: 400,
              height: double.infinity,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: 400,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 8 == 0) {
                    int day = (index ~/ 8) * 1 + 1;
                    int month = (day ~/ 30) + 1;
                    String text = 'Día $day/Mes $month';
                    return ListTile(
                      title: Center(child: Text(text)),
                    );
                  } else {
                    return ListTile(
                      title: Text('Cita: ${(index % 8)}'),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Citas extends StatefulWidget {
  @override
  _CitasState createState() => _CitasState();
}

class _CitasState extends State<Citas> {
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barberos'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(
              children: [
                CitaCard(
                  nombre: 'Fernando Mulardo',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
                ),
                CitaCard(
                  nombre: 'Gustavo Lorca',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
                ),
                CitaCard(
                  nombre: 'Fernando Mulardo',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
                ),
                CitaCard(
                  nombre: 'Gustavo Lorca',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
                ),
                CitaCard(
                  nombre: 'Fernando Mulardo',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
                ),
                CitaCard(
                  nombre: 'Gustavo Lorca',
                  imageUrl:
                      'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
