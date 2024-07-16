import 'package:flutter/material.dart';


class SearchBars extends StatelessWidget {
  const SearchBars({super.key, required this.focusNode, required this.onTap});
  final FocusNode focusNode;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: width * 1,
        height: height * 0.06,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: TextField(
          onTap: onTap,
          decoration: InputDecoration(
              hintText: 'search any product',
              hintStyle: TextStyle(color: Colors.grey[300]),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[300],
              ),
              suffixIcon: Icon(
                Icons.mic,
                color: Colors.grey[300],
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ),
      ),
    );
  }
}
