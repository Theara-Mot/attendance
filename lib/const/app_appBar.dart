import 'package:attendance/const/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildAppBar extends StatefulWidget {
  final String title;
  final IconData? notificationIcon;
  final bool check;
  final Widget bodyWidget;
  final VoidCallback? onTapNotification;
  final bool isShowBack;
  final bool centerTitle; // New parameter to control centering of the title

  const BuildAppBar({
    Key? key,
    required this.title,
    this.notificationIcon,
    this.check = false,
    required this.bodyWidget,
    this.onTapNotification,
    this.isShowBack = true,
    this.centerTitle = false, // Default to false
  }) : super(key: key);

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: widget.isShowBack
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: Text(
          widget.title.tr(),
          style: GoogleFonts.ubuntu(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: widget.centerTitle ?true: false, 
        actions: [
          if (widget.check && widget.notificationIcon != null)
            GestureDetector(
              onTap: widget.onTapNotification,
              child: Icon(
                widget.notificationIcon,
                color: Colors.white,
                size: 28,
              ),
            ),
          const SizedBox(width: 15),
        ],
      ),
      body: widget.bodyWidget,
    );
  }
}