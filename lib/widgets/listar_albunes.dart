import 'package:consumo_api/clear_architec/config/config_use_case.dart';
import 'package:consumo_api/clear_architec/dominio/models/album/albun.dart';
import 'package:flutter/material.dart';

class ListarAlbunes extends StatefulWidget {
  const ListarAlbunes({super.key});

  @override
  State<ListarAlbunes> createState() => _ListarAlbumState();
}

class _ListarAlbumState extends State<ListarAlbunes> {
  final UsecaseConfig _getAlbunes = UsecaseConfig();
  Future<List<Album>> listarAlbunes(List<Album> albums) async {
    int valor = 50;

    while (albums.length == valor) {
      albums.removeRange(0, 1000);
    }

    if (albums.length != valor) {
      return albums;
    } else {
      final updatedAlbums = await _getAlbunes.getAlbunCasouse.getAll();
      return listarAlbunes(updatedAlbums);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FutureBuilder<List<Album>>(
                  future: listarAlbunes([]),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Error al obtener la lista de álbumes');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const Text('No existen álbumes');
                    } else {
                      List<Album>? albums = snapshot.data;
                      return ListView.builder(
                        shrinkWrap: true, // Importante agregar esta línea
                        physics: const NeverScrollableScrollPhysics(), // y esta
                        itemCount: albums!.length,
                        itemBuilder: (context, index) {
                          Album album = albums[index];
                          return Card(
                            child: ListTile(
                              title: Text(album.title),
                              subtitle: Text(album.url),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
