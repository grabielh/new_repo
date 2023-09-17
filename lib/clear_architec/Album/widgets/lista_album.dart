import 'package:consumo_api/clear_architec/Album/config/config_use_case.dart';
import 'package:consumo_api/clear_architec/Album/dominio/models/album/albun.dart';
import 'package:flutter/material.dart';

class ListarAlbum extends StatefulWidget {
  const ListarAlbum({super.key});

  @override
  State<ListarAlbum> createState() => _ListarAlbumState();
}

class _ListarAlbumState extends State<ListarAlbum> {
  final UsecaseConfig _getAlbun = UsecaseConfig();
  final TextEditingController buscarAlbun = TextEditingController();
  List<Album> resultados = [];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: buscarAlbun,
          decoration: const InputDecoration(labelText: 'Buscar por ID'),
          keyboardType: TextInputType.number,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: FutureBuilder<Album>(
                    future:
                        _getAlbun.getAlbunCasouse.getAlbumID(buscarAlbun.text),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text(
                            'Error al obtener el álbum ingrese ID');
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return const Text('No existe álbum');
                      } else {
                        Album? album = snapshot.data;
                        return Card(
                          child: ListTile(
                            title: Text(album!.title),
                            subtitle: Text(album.url),
                            leading: SizedBox(
                              width: 80,
                              child: Image.network(album.thumbnailUrl),
                            ),
                          ),
                        );
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
