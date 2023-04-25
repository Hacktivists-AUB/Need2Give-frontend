import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/user.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/textfield.dart';

class EditProfile extends StatefulWidget {
  static const routeName = "/editUserProfile";
  final User user;
  const EditProfile({
    super.key,
    required this.user,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _editFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final AccountService _accountService = AccountService();
  DateTime? _selectedDate;

  void edit(BuildContext ctx) {
    _accountService.editUser(
      ctx,
      UserDTO(
        username: "",
        email: "",
        password: "",
        fullName: _nameController.text,
        birthDate: _selectedDate == null
            ? widget.user.birthDate
            : DateFormat('yyyy/MM/dd').format(_selectedDate!),
      ),
    );
  }

  @override
  void initState() {
    _nameController.text = widget.user.fullName;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.backgroundColor,
      appBar: AppBar(
        title: const Text("Edit profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _editFormKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Global.lightGrey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Global.green, width: 2.0),
                        ),
                        child: const CircleAvatar(
                          radius: 36,
                          backgroundColor: Global.white,
                          child: Icon(
                            Icons.person,
                            size: 54,
                            color: Global.mediumGrey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "@${widget.user.username}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Icon(
                                Icons.mail,
                                color: Global.mediumGrey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.user.email.length > 18
                                    ? "${widget.user.email.substring(0, 18)}..."
                                    : widget.user.email,
                                style: const TextStyle(
                                  color: Global.mediumGrey,
                                ),
                              ),
                            ],
                          ),
                          if (!(widget.user.phoneNumber == null ||
                              widget.user.phoneNumber == ""))
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Global.mediumGrey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  widget.user.phoneNumber!,
                                  style: const TextStyle(
                                    color: Global.mediumGrey,
                                  ),
                                ),
                              ],
                            ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Global.mediumGrey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                DateFormat("'Joined 'MMMM yyyy").format(
                                  DateTime.parse(widget.user.createdAt),
                                ),
                                style: const TextStyle(
                                  color: Global.mediumGrey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Label(text: "Name : "),
                Input(
                  controller: _nameController,
                  hintText: "Name",
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    await _generateCalendar(context);
                  },
                  child: const IconTextButton(
                    icon: Icons.calendar_month,
                    label: "Select your birthday",
                  ),
                ),
                const SizedBox(height: 16),
                Button(
                  text: "Save",
                  onPressed: () {
                    edit(context);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _generateCalendar(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(widget.user.birthDate),
      firstDate: DateTime(initialDate.year - 100),
      lastDate: initialDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
      });
    }
  }
}
