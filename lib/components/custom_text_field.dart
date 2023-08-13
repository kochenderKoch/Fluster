import 'package:flutter/material.dart';

/// A custom styled [TextField]
class CustomTextField extends StatefulWidget {
  /// Creates an [CustomTextField] Widget
  const CustomTextField({
    required this.controller,
    super.key,
    this.obscureText = false,
    this.prefixIcon,
    this.hintText,
  });

  /// The [TextEditingController] of the [TextField]
  final TextEditingController controller;

  /// Is the Text obsecured?
  final bool obscureText;

  /// The Icon in front of the [TextField]
  final Icon? prefixIcon;

  /// [hintText] that is displayed in the [TextField] when the input is empty.
  final String? hintText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText && _passwordVisibility,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      !_passwordVisibility
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisibility = !_passwordVisibility;
                      });
                    },
                  )
                : null,
            prefixIcon: widget.prefixIcon,
            contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            hintText: widget.hintText,
            //fillColor: Theme.of(context).backgroundColor,
            filled: true,
            errorStyle: const TextStyle(height: 0, color: Colors.transparent),
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Color(0xFF969A9D),
              fontWeight: FontWeight.w300,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(width: .5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(width: .5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(width: .5),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(width: .5),
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            //color: Color(0xFF3C3C43),
          ),
        ),
      ),
    );
  }
}
