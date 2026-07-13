import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/addnotes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

const List<Color> pastelColors = [
  Color(0xFFF8BBD0),
  Color(0xFFFFCDD2),
  Color(0xFFFFE0B2),
  Color(0xFFFFF9C4),
  Color(0xFFC8E6C9),
  Color(0xFFB2DFDB),
  Color(0xFFB3E5FC),
  Color(0xFFC5CAE9),
  Color(0xFFD1C4E9),
  Color(0xFFE1BEE7),
];

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isActive,
    required this.color,
  });

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 19,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 22,
            backgroundColor: color,
          );
  }
}

class ColorListview extends StatefulWidget {
  const ColorListview({
    super.key,
    this.note,
  });

  final NoteModel? note;

  @override
  State<ColorListview> createState() => _ColorListviewState();
}

class _ColorListviewState extends State<ColorListview> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    if (widget.note != null) {
      currentIndex = pastelColors.indexWhere(
        (color) => color.value == widget.note!.color,
      );

      if (currentIndex == -1) {
        currentIndex = 0;
      }
    } else {
      currentIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pastelColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });

                if (widget.note != null) {
                  widget.note!.color = pastelColors[index].value;
                } else {
                  context.read<AddNoteCubit>().color = pastelColors[index];
                }
              },
              child: ColorItem(
                color: pastelColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}