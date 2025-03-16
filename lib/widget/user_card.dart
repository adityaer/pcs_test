import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcs_test/constant/string_constant.dart';
import 'package:pcs_test/domain/entity/user.dart';
import 'package:pcs_test/extension/extension.dart';
import 'package:pcs_test/screen/user/user_detail_screen.dart';
import 'package:pcs_test/widget/image_box_with_shadow.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDetailScreen(user: user)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(1, 3)),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            ImageBoxWithShadow(imageUrl: user.avatar, height: 100, width: 100),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user.createdAt.stringDateToString(
                      StringConstants.dateFormatServer,
                      StringConstants.dateFormatDDMMMMYYYYWithSpace,
                    ),
                    style: GoogleFonts.montserrat(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
