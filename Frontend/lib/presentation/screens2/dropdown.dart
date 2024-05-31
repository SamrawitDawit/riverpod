import 'package:flutter/material.dart';

class MyDropdownButtonFormField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onRoleChanged;

  MyDropdownButtonFormField({required this.controller, required this.onRoleChanged});

  @override
  _MyDropdownButtonFormFieldState createState() => _MyDropdownButtonFormFieldState();
}

class _MyDropdownButtonFormFieldState extends State<MyDropdownButtonFormField> {
  String? _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.controller.text.isEmpty ? null : widget.controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedRole,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedRole = newValue;
          });
          widget.controller.text = newValue; // Update the controller's text
          widget.onRoleChanged(newValue); // Notify the parent about the role change
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(1),
        hintText: 'Role',
        prefixIcon: Icon(Icons.work, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: const Color.fromRGBO(27, 94, 32, 1), width: 10.0),
        ),
      ),
      items: <String>['Pharmacist', 'Client'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
