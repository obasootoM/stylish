import 'package:flutter/material.dart';


class SearchBars extends StatelessWidget {
  const SearchBars({super.key, required this.focusNode, this.onTap, this.onsubmitted});
  final FocusNode focusNode;
  final VoidCallback? onTap;
  final Function(String)? onsubmitted;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: width * 1,
        height: height * 0.07,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: TextField(
          onSubmitted: onsubmitted,
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
