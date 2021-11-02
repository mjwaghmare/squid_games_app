import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Color primaryClr;
  final Color textClr;
  final VoidCallback onTap;
  final String label;

  CustomButton({Key key, this.onTap, this.primaryClr, this.label, this.textClr}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: widget.primaryClr,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.textClr,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
