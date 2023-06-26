import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prevent/util/theme.dart';

class FormEdit extends StatelessWidget {
  const FormEdit({
    super.key,
    required this.nameController,
    required this.label,
    this.validator,
    this.inputType,
  });

  final TextEditingController nameController;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: semiBold),
        ),
        const SizedBox(height: 5),
        TextFormField(
            keyboardType: inputType,
            style: GoogleFonts.poppins(fontSize: 15, fontWeight: reguler),
            controller: nameController,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                filled: true,
                fillColor: colorStyleSecond,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10))),
            validator: validator),
        const SizedBox(height: 10),
      ],
    );
  }
}
