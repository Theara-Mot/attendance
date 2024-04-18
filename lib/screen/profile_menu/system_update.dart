import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_color.dart';

class SystemUpdate extends StatefulWidget {
  const SystemUpdate({Key? key}) : super(key: key);

  @override
  State<SystemUpdate> createState() => _SystemUpdateState();
}

class _SystemUpdateState extends State<SystemUpdate> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'system_update'.tr(),
      bodyWidget: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            'Smart HR',
                            style: GoogleFonts.fascinate(
                              fontSize: 25,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'ASIA WEILUY',
                            style: GoogleFonts.monoton(
                              fontSize: 20,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'V 3.0.97 (Latest Version)',
                            style: GoogleFonts.ubuntu(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Replace hardcoded data with dynamically generated columns
                    ...generateData(),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height:50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primaryColor,
              ),
              child: Center(
                child: Text(
                  'Download',
                  style: GoogleFonts.ubuntu(fontSize: 20,color:Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateData() {
    List<Widget> widgets = [];

    widgets.add(_buildColumnWithData('Version 2.1.3', ['Added dark mode support', 'Enhanced data synchronization']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.1.4', ['Improved app stability', 'Resolved minor UI glitches']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.1.5', ['Optimized battery usage', 'Enhanced data caching']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.2.0', ['Revamped user interface', 'Added new animation effects']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.2.1', ['Addressed accessibility issues', 'Refactored code for better performance']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.2.2', ['Improved error handling', 'Enhanced data encryption']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.2.3', ['Added support for landscape mode', 'Resolved navigation bugs']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.2.4', ['Fixed issues with data synchronization', 'Improved memory management']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.2.5', ['Enhanced search functionality', 'Improved loading times']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.3.0', ['Introduced in-app messaging feature', 'Optimized network requests']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.3.1', ['Fixed crashes reported by users', 'Addressed localization bugs']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.3.2', ['Improved data syncing logic', 'Resolved memory leaks']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.3.3', ['Enhanced user analytics', 'Resolved compatibility issues with older devices']));
    widgets.add(SizedBox(height: 20));
    widgets.add(_buildColumnWithData('Version 2.3.4', ['Improved user feedback mechanism', 'Resolved issues with push notifications']));
    widgets.add(SizedBox(height: 20));
    return widgets;
  }


  Widget _buildColumnWithData(String version, List<String> improvements) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(version, style: GoogleFonts.righteous(fontSize: 16)),
        for (int i = 0; i < improvements.length; i++)
          Text('${i + 1}. ${improvements[i]}', style: GoogleFonts.ubuntu(fontSize: 16)),
      ],
    );
  }
}
