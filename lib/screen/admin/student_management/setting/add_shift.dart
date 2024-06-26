import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/app_textField.dart';
import 'package:attendance/const/build_input_card.dart';
import 'package:attendance/screen/admin/student_management/setting/shift.dart';
import 'package:attendance/services/model/day_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/controller/day_controller.dart';

class AddShift extends StatefulWidget {
  final String? name;
  final String? status;
  final int? id;
  const AddShift({super.key, this.status, this.name, this.id});

  @override
  State<AddShift> createState() => _AddShiftState();
}

class _AddShiftState extends State<AddShift> {
  TextEditingController nameController = TextEditingController();
  bool valueData = false;
  String status = '';
  DayController dayController = DayController('shift');
  @override
  void initState() {
    nameController.text = widget.name??'';
    widget.status !=null && widget.status =='Active'?valueData=true:valueData=false;
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    print(widget.status);
    print(valueData);
    return BuildAppBar(
        centerTitle: true,
        title: widget.name ==null?'add_shift':'edit_shift', bodyWidget: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BuildInputCard(controller: nameController, hint: 'add_shift'),
          SizedBox(height: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('select_status'.tr(),style: GoogleFonts.notoSerifKhmer(
                  fontSize:16
              ),),
              CupertinoSwitch(
                value: valueData,
                onChanged:(value){
                  setState(() {
                    valueData  = value;
                    if(valueData == false){
                      status = 'Inactive';
                    }else{
                      status = 'Active';
                    }
                  });
                  print(status);
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: BuildButton(text:widget.name==null? 'submit':'save', function: (){

                Day day = Day(id: widget.id, name: nameController.text, status: status);
                if(widget.name == null){
                  dayController.createDay(nameController.text,status,context);
                  Navigator.pop(context,day);
                }else{
                  dayController.updateDay(widget.id!, nameController.text,status,context);
                  Navigator.pop(context,day);
                }
              })),
              if(widget.name !=null)
                SizedBox(width: 20,),
              if(widget.name !=null)
                Expanded(child: BuildButton(text:'Delete', color: Colors.red,
                    function: () async {
                      Day day = Day(id: widget.id, name: nameController.text, status: status);
                      await dayController.deleteDay(widget.id!,context);
                      Navigator.pop(context,day);
                    })),
            ],
          )
        ],
      ),
    ));
  }
}
