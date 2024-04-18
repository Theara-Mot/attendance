import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMemberDetail extends StatelessWidget {
  final Map<String, dynamic> memberData;

  TeamMemberDetail({required this.memberData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Member Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(memberData['avatar']),
              ),
              SizedBox(height: 20),
              Text(
                '${memberData['nameEn']} (${memberData['nameKh']})',
                style: GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'ID: ${memberData['id']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Department: ${memberData['department']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Email: ${memberData['email']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Phone: ${memberData['phone']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Date of Birth: ${memberData['dob']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Place of Birth: ${memberData['pob']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Salary: ${memberData['salary']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Join Date: ${memberData['joinDate']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Gender: ${memberData['gender']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Upline 1: ${memberData['staffUpline1']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Upline 2: ${memberData['staffUpline2']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Upline 3: ${memberData['staffUpline3']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Location ID: ${memberData['locationId']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Shift ID: ${memberData['shiftId']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
              Text(
                'Position: ${memberData['position']}',
                style: GoogleFonts.ubuntu(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
