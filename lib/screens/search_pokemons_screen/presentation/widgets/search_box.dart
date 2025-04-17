import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/themes/border_radiuses.dart';
import 'package:phongngo.pokedex/themes/offsets.dart';
import 'package:phongngo.pokedex/themes/sizes.dart';

class SearchBox extends StatefulWidget {
  final TextEditingController? searchTextEditingController;
  final Function(String searchText) onSearch;
  const SearchBox({
    super.key,
    required this.onSearch,
    this.searchTextEditingController,
  });

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController? _textEditingController;
  String _searchText = '';

  @override
  void initState() {
    _textEditingController =
        widget.searchTextEditingController ?? TextEditingController();

    _textEditingController?.addListener(() {
      if (_textEditingController?.text != _searchText) {
        _searchText = _textEditingController?.text ?? '';
        widget.onSearch(_textEditingController?.text ?? '');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: roundedXxl,
      ),
      padding: horizontalInsetsBase.add(topInsetsBase),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: bottomInsetsS,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: roundedXxl,
              ),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: topInsetsXxs,
                  hintText: 'Enter id or name',
                  border: InputBorder.none,
                  prefixIconConstraints: const BoxConstraints(maxWidth: l),
                  prefixIcon: Padding(
                    padding: rightInsetsXs,
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: m,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(maxWidth: l),
                  suffixIcon: IconButton(
                    padding: allInsetsZero,
                    icon: const Icon(
                      Icons.close,
                      size: m,
                    ),
                    onPressed: _textEditingController?.clear,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.searchTextEditingController == null) {
      _textEditingController?.dispose();
    }

    super.dispose();
  }
}
