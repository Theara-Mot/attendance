import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/build_input_card.dart';
import 'package:attendance/services/model/time_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/controller/time_controller.dart';

class AddTime extends StatefulWidget {
  final String? name;
  final String? status;
  final int? id;
  const AddTime({super.key, this.status, this.name, this.id});

  @override
  State<AddTime> createState() => _AddTimeState();
}

class _AddTimeState extends State<AddTime> {
  TextEditingController nameController = TextEditingController();
  bool valueData = false;
  String status = 'Inactive';
  TimeController timeController = TimeController('times');

  @override
  void initState() {
    nameController.text = widget.name ?? '';
    widget.status != null ? status = widget.status! : '';
    widget.status != null && widget.status == 'Active' ? valueData = true : valueData = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: widget.name == null ? 'add_time'.tr() : 'edit_time'.tr(),
      bodyWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BuildInputCard(controller: nameController, hint: 'add_time'.tr()),
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'select_status'.tr(),
                  style: GoogleFonts.notoSerifKhmer(fontSize: 16),
                ),
                CupertinoSwitch(
                  value: valueData,
                  onChanged: (value) {
                    setState(() {
                      valueData = value;
                      status = valueData ? 'Active' : 'Inactive';
                    });
                    print(status);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: BuildButton(
                    text: widget.name == null ? 'submit'.tr() : 'save'.tr(),
                    function: () {
                      Time updatedData = Time(
                        name: nameController.text,
                        id: widget.id,
                        status: status,
                      );
                      if (widget.name == null) {
                        timeController.createTime(nameController.text, status, context).then((value) {
                          Navigator.pop(context, updatedData);
                        });
                      } else {
                        timeController.updateTime(widget.id!, nameController.text, status, context).then((value) {
                          Navigator.pop(context, updatedData);
                        });
                      }
                    },
                  ),
                ),
                if (widget.name != null) SizedBox(width: 20),
                if (widget.name != null)
                  Expanded(
                    child: BuildButton(
                      text: 'delete'.tr(),
                      color: Colors.red,
                      function: () async {
                        await timeController.deleteTime(widget.id!, context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
