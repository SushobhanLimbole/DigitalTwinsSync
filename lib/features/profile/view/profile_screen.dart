import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class DigitalTwinProfileScreen extends StatefulWidget {
  const DigitalTwinProfileScreen({super.key});

  @override
  State<DigitalTwinProfileScreen> createState() =>
      _DigitalTwinProfileScreenState();
}

class _DigitalTwinProfileScreenState extends State<DigitalTwinProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Alex Ryder');
  final _roleController = TextEditingController(text: 'Project Manager');
  bool _enablePersonalization = true;
  bool _enableAutomations = false;
  String _notificationLevel = 'Balanced';
  String _theme = 'Dark';

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101022).withOpacity(0.8),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ),
        title: const Text(
          'My Digital Twin',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.015 * 18 / 1000,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Save logic here
            },
            child: const Text(
              'Save',
              style: TextStyle(
                color: Color(0xFF4D9FFF),
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 0.015 * 16 / 1000,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
        backgroundColor: const Color(0x991C1C27),
        elevation: 0,
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              // Avatar Section
              const Align(
                alignment: Alignment.center,
                child: _AvatarWithEdit(),
              ),
              const SizedBox(height: 32),
              // Personal Information
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x991C1C27),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                        color: Color(0xFF4D9FFF),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 18 / 1000,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _FormField(
                            label: 'Full Name',
                            controller: _nameController,
                            placeholder: 'Enter your full name',
                          ),
                          _FormField(
                            label: 'Role',
                            controller: _roleController,
                            placeholder: 'e.g. Project Manager',
                          ),
                          _FormField(
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
              ),
              const SizedBox(height: 16),
              // AI Engine
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x991C1C27),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'AI Engine',
                              style: TextStyle(
                                color: Color(0xFF4D9FFF),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.015 * 18 / 1000,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.info, color: Colors.white54, size: 20),
                          ],
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _ToggleItem(
                      title: 'Enable AI Personalization',
                      subtitle:
                          'Allow your Twin to learn from your workflows to provide smarter assistance.',
                      value: _enablePersonalization,
                      onChanged: (value) =>
                          setState(() => _enablePersonalization = value),
                    ),
                    const Divider(color: Colors.white10),
                    _ToggleItem(
                      title: 'Enable AI Automations',
                      subtitle:
                          'Allow your Twin to automatically perform tasks on your behalf.',
                      value: _enableAutomations,
                      onChanged: (value) =>
                          setState(() => _enableAutomations = value),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Preferences
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x991C1C27),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Preferences',
                      style: TextStyle(
                        color: Color(0xFF4D9FFF),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.015 * 18 / 1000,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _DropdownField(
                      label: 'Notification Level',
                      value: _notificationLevel,
                      items: const ['Minimal', 'Balanced', 'All'],
                      onChanged: (value) =>
                          setState(() => _notificationLevel = value!),
                    ),
                    _DropdownField(
                      label: 'Theme',
                      value: _theme,
                      items: const ['Light', 'Dark', 'System'],
                      onChanged: (value) => setState(() => _theme = value!),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Log Out Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    // Log out logic
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0x331313EC), // primary/20
                    foregroundColor: const Color(0xFF4D9FFF),
                    side: BorderSide(
                      color: const Color(0xFF4D9FFF).withOpacity(0.2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarWithEdit extends StatelessWidget {
  const _AvatarWithEdit();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCfLtoQTZz2vbaTj2EPmOAAf-q3A-kblu8TyIiLr9s9YJc6lwBH1MGBSg_7hJvXzg-1IBtDeEPPab1ra3y2iH_nCwGR9BH0PC9Q-8J9IxFWmbls9Q3gqydFXlXRTfy5P_3vBr1kLBuyqWbJZBf-hy5NM7hbZxaEX7y3oD9pwgGX0NvIaxBK1X8PtJIeEhQ9WVX6wOaYo11rXZXgVxYgGnvBRlOBs3DNzXdDQn2xvA1zkCZjp1dZxZPMv6voJFQpXndpYhmewHG1zcE',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4D9FFF),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF121212), width: 4),
            ),
            child: const Icon(Icons.edit, color: Color(0xFF121212), size: 20),
          ),
        ),
      ],
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String placeholder;
  final bool enabled;

  const _FormField({
    required this.label,
    required this.controller,
    required this.placeholder,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFEAEAEA),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: const Color(0xFF9D9DB9)),
            filled: true,
            fillColor: const Color(0xFF282839),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF4D9FFF)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class _ToggleItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleItem({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Use Expanded to allow the text column to take available space and
    // ensure the Switch doesn't cause overflow on narrow screens.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF4D9FFF),
          activeTrackColor: const Color(0x1A4D9FFF),
          inactiveThumbColor: Colors.white54,
          inactiveTrackColor: const Color(0xFF282839),
        ),
      ],
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const _DropdownField({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFEAEAEA),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF282839),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              icon: const Icon(Icons.expand_more, color: Colors.white54),
            ),
          ),
        ),
      ],
    );
  }
}
