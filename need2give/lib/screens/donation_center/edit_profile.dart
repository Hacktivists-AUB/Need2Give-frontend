import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:need2give/constants/global.dart';
import 'package:need2give/models/donation_center.dart';
import 'package:need2give/services/account_service.dart';
import 'package:need2give/widgets/button.dart';
import 'package:need2give/widgets/location_picker.dart';
import 'package:need2give/widgets/schedule.dart';
import 'package:need2give/widgets/textfield.dart';

class EditProfile extends StatefulWidget {
  static const routeName = "/editDonationCenterProfile";
  final DonationCenter donationCenter;
  const EditProfile({
    super.key,
    required this.donationCenter,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _editFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  LatLng? _selectedLocation;
  Map<String, dynamic>? _selectedSchedule;

  final AccountService _accountService = AccountService();

  void _onLocationSelected(LatLng loc) {
    setState(() {
      _selectedLocation = loc;
    });
  }

  void _onScheduleSelected(Map<String, dynamic> schedule) {
    setState(() {
      _selectedSchedule = schedule;
    });
  }

  void edit(BuildContext ctx) {
    _accountService.edit(
      ctx,
      DonationCenterDTO(
        username: "",
        email: "",
        password: "",
        name: _nameController.text,
        latitude: _selectedLocation != null
            ? _selectedLocation!.latitude
            : widget.donationCenter.latitude,
        longitude: _selectedLocation != null
            ? _selectedLocation!.longitude
            : widget.donationCenter.longitude,
        openingTime: _selectedSchedule != null
            ? _selectedSchedule!["opening_time"]
            : widget.donationCenter.openingTime,
        closingTime: _selectedSchedule != null
            ? _selectedSchedule!["closing_time"]
            : widget.donationCenter.closingTime,
        description: _descriptionController.text,
        openingDays: _selectedSchedule != null
            ? _selectedSchedule!["opening_days"]
            : widget.donationCenter.openingDays,
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    _nameController.text = widget.donationCenter.name;
    _descriptionController.text = widget.donationCenter.description;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
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
                        child: CircleAvatar(
                          radius: 36,
                          backgroundColor: Global.white,
                          child: Image.asset("assets/donation_center.png"),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "@${widget.donationCenter.username}",
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
                                widget.donationCenter.email,
                                style: const TextStyle(
                                  color: Global.mediumGrey,
                                ),
                              ),
                            ],
                          ),
                          if (!(widget.donationCenter.phoneNumber == null ||
                              widget.donationCenter.phoneNumber == ""))
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: Global.mediumGrey,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  widget.donationCenter.phoneNumber!,
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
                                  DateTime.parse(
                                      widget.donationCenter.createdAt),
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext buildContext) {
                        return Schedule(onConfirm: _onScheduleSelected);
                      },
                    );
                  },
                  child: const IconTextButton(
                    icon: Icons.schedule,
                    label: "Select working hours",
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context)
                          .modalBarrierDismissLabel,
                      barrierColor: Colors.black45,
                      transitionDuration: const Duration(milliseconds: 200),
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return LocationPicker(onConfirm: _onLocationSelected);
                      },
                    );
                  },
                  child: const IconTextButton(
                    icon: Icons.location_pin,
                    label: "Select your location",
                  ),
                ),
                const SizedBox(height: 10),
                const Label(text: "Description* : "),
                Input(
                  controller: _descriptionController,
                  hintText: "Description",
                  numberOfLines: 4,
                  required: false,
                ),
                const SizedBox(height: 16),
                Button(
                  text: "Save",
                  onPressed: () {
                    edit(context);
                    Navigator.pop(context, true);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
