import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/app_textField.dart';
import 'package:attendance/const/build_input_card.dart';
import 'package:flutter/material.dart';

class AddLecturerLevel extends StatefulWidget {
  final String? name;
  final String? status;
  const AddLecturerLevel({super.key, this.status, this.name});

  @override
  State<AddLecturerLevel> createState() => _AddLecturerLevelState();
}

class _AddLecturerLevelState extends State<AddLecturerLevel> {
  TextEditingController nameController = TextEditingController();
  List<String>data =['active','inactive' ];
  @override
  void initState() {
    nameController.text = widget.name??'';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        centerTitle: true,
        title: widget.name ==null?'add_lecturer_level':'edit_lecturer_level', bodyWidget: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BuildInputCard(controller: nameController, hint: 'add_lecturer_level'),
          SizedBox(height: 3,),
          BuildSelectText(
            selectText: widget.status == null? 'select_status' : widget.status!,
            textList: data,
            label: 'select_status',
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: BuildButton(text:widget.name==null? 'submit':'save', function: (){

              })),
              if(widget.name !=null)
                SizedBox(width: 20,),
              if(widget.name !=null)
                Expanded(child: BuildButton(text:'Delete', color: Colors.red,
                    function: (){

                    })),
            ],
          )
        ],
      ),
    ));
  }
}
