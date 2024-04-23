import 'package:attendance/const/app_appBar.dart';
import 'package:attendance/const/app_buildButton.dart';
import 'package:attendance/const/app_textField.dart';
import 'package:attendance/const/build_input_card.dart';
import 'package:flutter/material.dart';

class AddDay extends StatefulWidget {
  final String? name;
  final String? status;
  const AddDay({super.key, this.status, this.name});

  @override
  State<AddDay> createState() => _AddDayState();
}

class _AddDayState extends State<AddDay> {
  TextEditingController nameController = TextEditingController();
  List<String>data =['active','Inactive' ];
  @override
  void initState() {
    nameController.text = widget.name??'';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
        centerTitle: true,
        title: widget.name ==null?'add_day':'edit_day', bodyWidget: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          BuildInputCard(controller: nameController, hint: 'add_day'),
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
