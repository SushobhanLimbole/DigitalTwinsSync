import 'package:digital_twins/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/personal/avatar_with_edit.dart';
import '../widgets/personal/personal_info_card.dart';
import '../widgets/ai_engine/ai_engine_card.dart';
import '../widgets/preferences/preferences_card.dart';
import '../widgets/general/logout_button.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101022),
      drawer: const CustomDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: const Text(
        'My Digital Twin',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: const Color(0x991C1C27),
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(
              color: Color(0xFF4D9FFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: AvatarWithEdit(),
          ),
          const SizedBox(height: 32),

          PersonalInfoCard(
            formKey: _formKey,
            nameController: _nameController,
            roleController: _roleController,
          ),

          const SizedBox(height: 16),

          AiEngineCard(
            enablePersonalization: _enablePersonalization,
            enableAutomations: _enableAutomations,
            onPersonalizationChanged: (v) =>
                setState(() => _enablePersonalization = v),
            onAutomationsChanged: (v) =>
                setState(() => _enableAutomations = v),
          ),

          const SizedBox(height: 16),

          PreferencesCard(
            notificationLevel: _notificationLevel,
            theme: _theme,
            onNotificationChanged: (v) =>
                setState(() => _notificationLevel = v!),
            onThemeChanged: (v) => setState(() => _theme = v!),
          ),

          const SizedBox(height: 32),

          const LogoutButton(),
        ],
      ),
    );
  }
}