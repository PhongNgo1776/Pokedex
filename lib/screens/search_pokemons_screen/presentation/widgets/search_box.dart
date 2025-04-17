import 'package:flutter/material.dart';
import 'package:phongngo.pokedex/themes/border_radiuses.dart';
import 'package:phongngo.pokedex/themes/offsets.dart';
import 'package:phongngo.pokedex/themes/sizes.dart';
import 'package:phongngo.pokedex/themes/spacings.dart';

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

  @override
  void initState() {
    _textEditingController =
        widget.searchTextEditingController ?? TextEditingController();

    _textEditingController?.addListener(() {
      widget.onSearch(_textEditingController?.text ?? '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalInsetsBase.add(topInsetsBase),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: allInsets6,
              height: l,
              decoration: BoxDecoration(
                borderRadius: roundedXxl,
              ),
              child: TextField(
                controller: _textEditingController,
                cursorHeight: m,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter id or name',
                  contentPadding: const EdgeInsets.only(bottom: 2),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  prefixIconConstraints: const BoxConstraints(maxWidth: l),
                  prefixIcon: Padding(
                    padding: rightInsetsXs,
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  suffixIconConstraints: const BoxConstraints(maxWidth: l),
                  suffixIcon: IconButton(
                    padding: allInsetsZero,
                    icon: const Icon(
                      Icons.close,
                    ),
                    onPressed: _textEditingController?.clear,
                  ),
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _textEditingController!,
            builder: (context, value, child) => Visibility(
              visible: value.text.isNotEmpty,
              child: Row(
                children: [
                  horizontalSpaceBase,
                  TextButton(
                      onPressed: () => _textEditingController?.clear(),
                      child: Text('Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: s,
                          ))),
                ],
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
