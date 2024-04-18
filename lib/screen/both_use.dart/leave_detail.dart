import 'package:attendance/const/app_appBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveDetail extends StatelessWidget {
  final Map<String, dynamic> leaveData;

  const LeaveDetail({Key? key, required this.leaveData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildAppBar(
      title: 'leave_detail',
      centerTitle: true, 
      bodyWidget: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${leaveData['leaveType'].toString().tr()}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                  ),
                ),
                Text(
                  '${leaveData['requestDays']} ${'days'.tr()}',
                  style: GoogleFonts.ubuntu(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 20),
                _buildLeaveDetailItem('${'from_date'.tr()}', leaveData['fromDate']),
                SizedBox(height: 10),
                _buildLeaveDetailItem('${'to_date'.tr()}', leaveData['toDate']),
                SizedBox(height: 10),
                _buildLeaveDetailItem('${'requested_by'.tr()}', leaveData['requestBy']),
                SizedBox(height: 10),
                _buildLeaveDetailItem('${'approved_by'.tr()}', leaveData['approveBy']),
                SizedBox(height: 10),
                _buildLeaveDetailItem('${'reason'.tr()}', leaveData['reason']),
                SizedBox(height: 10),
                _buildLeaveDetailItem('${'status'.tr()}', leaveData['status'].toString().tr()),
                if (leaveData['status'] == 'pending') 
                  SizedBox(height: 30),
                if (leaveData['status'] == 'pending') 
                  GestureDetector(
                    onTap: () {
                      // Implement cancel leave action
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'cancel_leave'.tr(),
                          style: GoogleFonts.ubuntu(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ));
  }

  Widget _buildLeaveDetailItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.ubuntu(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
