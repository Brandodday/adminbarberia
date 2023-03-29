import 'package:flutter/material.dart';
import 'package:collection/collection.dart';


class Cita {
  final int id;
  final String barbero;
  final String imageUrl;
  final String agendadoPor;
  final String costo;
  final DateTime fecha;

  Cita({
    required this.id,
    required this.barbero,
    required this.imageUrl,
    required this.agendadoPor,
    required this.costo,
    required this.fecha,
  });
}



class CitaItem extends StatelessWidget {
  final Cita cita;

  const CitaItem({Key? key, required this.cita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CitaCard(citas: [cita]),
    );
  }
}


class CitaCard extends StatelessWidget {
  final List<Cita> citas;

  const CitaCard({
    Key? key,
    required this.citas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: double.infinity,
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(citas.first.imageUrl),
                ),
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(citas.first.barbero),
                    
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              width: 400,
              height: double.infinity,
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: citas.length,
                itemBuilder: (BuildContext context, int index) {
                  final cita = citas[index];
                  return ListTile(
                   title: Text('${cita.fecha.day}/${cita.fecha.month}/${cita.fecha.year} / ${cita.fecha.hour > 11 ? cita.fecha.hour - 12 : cita.fecha.hour}:${cita.fecha.minute} ${cita.fecha.hour > 11 ? 'pm' : 'am'}'),

                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Agendado por: ${cita.agendadoPor}'),
                        Text('Costo: ${cita.costo.isNotEmpty ? cita.costo : 'No especificado'}'),
                       
                        
                      ],
                    ),
                  );
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
  const Citas({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CitasState createState() => _CitasState();
}

class _CitasState extends State<Citas> {
  

  @override
  Widget build(BuildContext context) {
    final citas = [
      Cita(
        id: 1,
        barbero: 'Fernando Mulardo',
        imageUrl: 'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit145_H0ZH.jpg?v=1666245758331',
        agendadoPor: 'Juan Pérez',
        costo: '20.0',
        fecha: DateTime(2023, 3, 23, 10, 0),
      ),
      Cita(
        id: 2,
        barbero: 'Laura Fernández',
        imageUrl: 'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit135_H0ZH.jpg?v=1666246334562',
        agendadoPor: 'Ana Gómez',
        costo: '15.0',
        fecha: DateTime(2023, 4, 23, 14, 0),
      ),
      Cita(
        id: 3,
        barbero: 'Carlos Pérez',
        imageUrl: 'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit130_H0ZH.jpg?v=1666245220501',
        agendadoPor: 'María García',
        costo: '25.0',
        fecha: DateTime(2023, 5, 23, 10, 0),
      ),
      Cita(
        id: 4,
        barbero: 'Marta González',
        imageUrl: 'https://cdn.shopify.com/s/files/1/0256/2611/6174/t/5/assets/khbaysideedit146_H0ZH.jpg?v=1666245762682',
        agendadoPor: 'Pedro Martínez',
        costo: '18.0',
        fecha: DateTime(2023, 6, 23, 21, 0),
      ),
      
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: citas.length,
      itemBuilder: (BuildContext context, int index) {
        final cita = citas[index];
        return Material(child: CitaItem(cita: cita));
      },
    );
  }
}