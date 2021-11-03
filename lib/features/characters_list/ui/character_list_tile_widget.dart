import 'package:flutter/material.dart';

class CharacterListTileWidget extends StatelessWidget {
  final String _name;
  final String _imageUrl;

  const CharacterListTileWidget(
      {Key? key, required String name, required String imageUrl})
      : _name = name,
        _imageUrl = imageUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.network(
            _imageUrl,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              _name,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
