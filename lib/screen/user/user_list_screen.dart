import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcs_test/helper/helper_enum.dart';
import 'package:pcs_test/screen/user/user_notifier.dart';
import 'package:pcs_test/widget/progress_dot.dart';
import 'package:pcs_test/widget/user_card.dart';
import 'package:provider/provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<UserNotifier>(context, listen: false).fetchUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('PCS Test', style: GoogleFonts.montserrat()),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<UserNotifier>(
                  builder: (context, data, child) {
                    return data.state == RequestState.loading
                        ? Center(child: WidgetDotBounce(color: Colors.blue))
                        : data.state == RequestState.loaded
                        ? ListView.builder(
                          itemBuilder: (context, index) {
                            var user = data.userList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: UserCard(user: user),
                            );
                          },
                        )
                        : Center(child: Text('Can not load data!'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
