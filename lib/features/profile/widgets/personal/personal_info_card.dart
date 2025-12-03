import 'package:flutter/material.dart';
import 'profile_form_field.dart';
import '../general/section_header.dart';

class PersonalInfoCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController roleController;

  const PersonalInfoCard({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.roleController,
  });

  @override
  Widget build(BuildContext context) {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'Personal Information'),
          const SizedBox(height: 16),
          Form(
            key: formKey,
            child: Column(
              children: [
                ProfileFormField(
                  label: 'Full Name',
                  controller: nameController,
                  placeholder: 'Enter your full name',
                ),
                ProfileFormField(
                  label: 'Role',
                  controller: roleController,
                  placeholder: 'e.g. Project Manager',
                ),
                ProfileFormField(
                  label: 'Email Address',
                  controller: TextEditingController(
                    text: 'alex.ryder@digitaltwin.io',
                  ),
                  placeholder: '',
                  enabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x991C1C27),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}