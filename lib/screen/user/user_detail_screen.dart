import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcs_test/domain/entity/user.dart';
import 'package:pcs_test/extension/extension.dart';
import 'package:pcs_test/widget/image_box_with_shadow.dart';

class UserDetailScreen extends StatefulWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  ImageBoxWithShadow(
                    imageUrl: widget.user.avatar,
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  _buildTextRow('First Name', user.name.getFirstName()),
                  _buildTextRow('Last Name', user.name.getLastName()),
                  _buildTextRow(
                    'Address',
                    '${user.addressNo} ${user.street} ${user.zipCode} ${user.country}',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildTextRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
