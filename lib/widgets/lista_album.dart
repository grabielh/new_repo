import 'package:flutter/material.dart';

class ListarAlbum extends StatefulWidget {
  const ListarAlbum({super.key});

  @override
  State<ListarAlbum> createState() => _ListarAlbumState();
}

class _ListarAlbumState extends State<ListarAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar Album'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.light_mode))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return const SingleChildScrollView(
                child: Card(
                  child: ListTile(
                    title: Text('Date'),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
