import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.autofocus = false,
    this.hintText = 'Search City Destination',
    required this.textRef
  });

  final bool autofocus;
  final String hintText;
  final TextEditingController textRef;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autofocus,
      controller: widget.textRef,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0)
        ),
        disabledBorder: InputBorder.none,
        alignLabelWithHint: true,
        hintText: widget.hintText,
        suffixIcon: widget.textRef.text.isNotEmpty ? IconButton(
          onPressed: () {
            setState(() {
              widget.textRef.clear();
            });
          },
          icon: const Icon(Icons.close, size: 20,)
        ) : const Icon(Icons.search, size: 20)
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}