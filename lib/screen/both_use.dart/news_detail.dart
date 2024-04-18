import 'package:flutter/material.dart';

import '../../const/app_appBar.dart';

class NewDetail extends StatefulWidget {
  const NewDetail({super.key});

  @override
  State<NewDetail> createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetail> {
  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      centerTitle: true,
      title: 'new_detail',
      bodyWidget: Column(),
    );
  }
}