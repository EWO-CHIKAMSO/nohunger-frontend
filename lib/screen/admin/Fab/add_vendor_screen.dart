import 'package:flutter/material.dart';

class GroupSettingsScreen extends StatefulWidget {
  const GroupSettingsScreen({Key? key}) : super(key: key);

  @override
  State<GroupSettingsScreen> createState() => _GroupSettingsScreenState();
}

class _GroupSettingsScreenState extends State<GroupSettingsScreen> {
  bool isEditProfileExpanded = true;
  bool isNotificationsExpanded = true;
  bool isAdvancedSettingsExpanded = true;
  bool isAdditionalInfoExpanded = true;

  // Toggle states
  bool allowMembership = true;
  bool allowComments = true;
  bool allowSharing = true;
  bool allowDownloads = true;

  // Checkbox states
  bool option1Selected = true;
  bool option2Selected = false;
  bool option3Selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group 3', style: TextStyle(fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.group),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.apps),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: constraints.maxWidth, // Use LayoutBuilder to constrain width
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
               decoration: BoxDecoration(
              color:Color(0xFFF5F5F5),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Manage Group Configuration',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Edit Profile Section
                  _buildSectionHeader(
                    'Edit Profile Section',
                    
                    isEditProfileExpanded,
                    () => setState(() => isEditProfileExpanded = !isEditProfileExpanded),
                  ),
                  if (isEditProfileExpanded) _buildEditProfileSection(),

                  const SizedBox(height: 16),

                  // Notification Settings
                  _buildSectionHeader(
                    'Notification Settings',
                    isNotificationsExpanded,
                    () => setState(() => isNotificationsExpanded = !isNotificationsExpanded),
                  ),
                  if (isNotificationsExpanded) _buildNotificationSettings(),

                  const SizedBox(height: 16),

                  // Advanced Settings
                  _buildSectionHeader(
                    'Advanced Settings',
                    isAdvancedSettingsExpanded,
                    () => setState(() => isAdvancedSettingsExpanded = !isAdvancedSettingsExpanded),
                  ),
                  if (isAdvancedSettingsExpanded) _buildAdvancedSettings(),

                  const SizedBox(height: 16),

                  // Additional Information
                  _buildSectionHeader(
                    'Additional Information',
                    isAdditionalInfoExpanded,
                    () => setState(() => isAdditionalInfoExpanded = !isAdditionalInfoExpanded),
                  ),
                  if (isAdditionalInfoExpanded) _buildAdditionalInfo(),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isExpanded, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        // Group Name Field
        _buildTextField('Group Name', 'Enter group name'),

        const SizedBox(height: 16),

        // Description Field
        _buildTextField('Description', 'Enter description', maxLines: 3),

        const SizedBox(height: 16),

        // Category Field
        _buildTextField('Category', 'Select category'),

        const SizedBox(height: 16),

        // Location Field
        _buildTextField('Location', 'Enter location'),

        const SizedBox(height: 16),

        // Save Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 120, // Limit button width to prevent infinite width
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        // Operating Hours
        const Text(
          'Operating Hours',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),

        // Time Selection
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('9:00 AM', style: TextStyle(fontSize: 14)),
                    Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text('to', style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('5:00 PM', style: TextStyle(fontSize: 14)),
                    Icon(Icons.arrow_drop_down, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Optional Features
        const Text(
          'Optional Features',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),

        // Toggle Switches
        _buildToggleOption(
          'Allow membership requests',
          allowMembership,
          (value) => setState(() => allowMembership = value),
        ),
        _buildToggleOption(
          'Allow comments',
          allowComments,
          (value) => setState(() => allowComments = value),
        ),
        _buildToggleOption(
          'Allow sharing',
          allowSharing,
          (value) => setState(() => allowSharing = value),
        ),
        _buildToggleOption(
          'Allow downloads',
          allowDownloads,
          (value) => setState(() => allowDownloads = value),
        ),
      ],
    );
  }

  Widget _buildAdvancedSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),

        // Privacy Options
        const Text(
          'Privacy Options',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),

        // Checkboxes
        _buildCheckboxOption(
          'Option 1',
          option1Selected,
          (value) => setState(() => option1Selected = value ?? false),
        ),
        _buildCheckboxOption(
          'Option 2',
          option2Selected,
          (value) => setState(() => option2Selected = value ?? false),
        ),
        _buildCheckboxOption(
          'Option 3',
          option3Selected,
          (value) => setState(() => option3Selected = value ?? false),
        ),

        const SizedBox(height: 16),

        // Update Button
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(width: 8),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 120, // Limit button width to prevent infinite width
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalInfo() {
    return Container(
      width: double.infinity, // Ensure container takes full width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.info_outline,
            size: 48,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Additional information about group settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 32, // Account for padding
          ),
          child: TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              fillColor:Colors.white,
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleOption(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.check_circle_outline,
            color: value ? Colors.blue : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxOption(String title, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class GroupSettingsScreen extends StatefulWidget {
//   const GroupSettingsScreen({Key? key}) : super(key: key);

//   @override
//   State<GroupSettingsScreen> createState() => _GroupSettingsScreenState();
// }

// class _GroupSettingsScreenState extends State<GroupSettingsScreen> {
//   bool isEditProfileExpanded = true;
//   bool isNotificationsExpanded = true;
//   bool isAdvancedSettingsExpanded = true;
//   bool isAdditionalInfoExpanded = true;
  
//   // Toggle states
//   bool allowMembership = true;
//   bool allowComments = true;
//   bool allowSharing = true;
//   bool allowDownloads = true;
  
//   // Checkbox states
//   bool option1Selected = true;
//   bool option2Selected = false;
//   bool option3Selected = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Group 3', style: TextStyle(fontWeight: FontWeight.w500)),
//         leading: IconButton(
//           icon: const Icon(Icons.group),
//           onPressed: () {},
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.apps),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.more_vert),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 8),
//               const Text(
//                 'Manage Group Configuration',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(height: 16),
              
//               // Edit Profile Section
//               _buildSectionHeader(
//                 'Edit Profile Section',
//                 isEditProfileExpanded,
//                 () => setState(() => isEditProfileExpanded = !isEditProfileExpanded),
//               ),
//               if (isEditProfileExpanded) _buildEditProfileSection(),
              
//               const SizedBox(height: 16),
              
//               // Notification Settings
//               _buildSectionHeader(
//                 'Notification Settings',
//                 isNotificationsExpanded,
//                 () => setState(() => isNotificationsExpanded = !isNotificationsExpanded),
//               ),
//               if (isNotificationsExpanded) _buildNotificationSettings(),
              
//               const SizedBox(height: 16),
              
//               // Advanced Settings
//               _buildSectionHeader(
//                 'Advanced Settings',
//                 isAdvancedSettingsExpanded,
//                 () => setState(() => isAdvancedSettingsExpanded = !isAdvancedSettingsExpanded),
//               ),
//               if (isAdvancedSettingsExpanded) _buildAdvancedSettings(),
              
//               const SizedBox(height: 16),
              
//               // Additional Information
//               _buildSectionHeader(
//                 'Additional Information',
//                 isAdditionalInfoExpanded,
//                 () => setState(() => isAdditionalInfoExpanded = !isAdditionalInfoExpanded),
//               ),
//               if (isAdditionalInfoExpanded) _buildAdditionalInfo(),
              
//               const SizedBox(height: 32),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title, bool isExpanded, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         child: Row(
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Spacer(),
//             Icon(
//               isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//               color: Colors.grey,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildEditProfileSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 8),
        
//         // Group Name Field
//         _buildTextField('Group Name', 'Enter group name'),
        
//         const SizedBox(height: 16),
        
//         // Description Field
//         _buildTextField('Description', 'Enter description', maxLines: 3),
        
//         const SizedBox(height: 16),
        
//         // Category Field
//         _buildTextField('Category', 'Select category'),
        
//         const SizedBox(height: 16),
        
//         // Location Field
//         _buildTextField('Location', 'Enter location'),
        
//         const SizedBox(height: 16),
        
//         // Save Button
//         Align(
//           alignment: Alignment.centerRight,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//             ),
//             child: const Text('Save'),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildNotificationSettings() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 8),
        
//         // Operating Hours
//         const Text(
//           'Operating Hours',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
        
//         // Time Selection
//         Row(
//           children: [
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text('9:00 AM', style: TextStyle(fontSize: 14)),
//                     Icon(Icons.arrow_drop_down, color: Colors.grey),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             const Text('to', style: TextStyle(color: Colors.grey)),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text('5:00 PM', style: TextStyle(fontSize: 14)),
//                     Icon(Icons.arrow_drop_down, color: Colors.grey),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
        
//         const SizedBox(height: 24),
        
//         // Optional Features
//         const Text(
//           'Optional Features',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 16),
        
//         // Toggle Switches
//         _buildToggleOption(
//           'Allow membership requests',
//           allowMembership,
//           (value) => setState(() => allowMembership = value),
//         ),
//         _buildToggleOption(
//           'Allow comments',
//           allowComments,
//           (value) => setState(() => allowComments = value),
//         ),
//         _buildToggleOption(
//           'Allow sharing',
//           allowSharing,
//           (value) => setState(() => allowSharing = value),
//         ),
//         _buildToggleOption(
//           'Allow downloads',
//           allowDownloads,
//           (value) => setState(() => allowDownloads = value),
//         ),
//       ],
//     );
//   }

//   Widget _buildAdvancedSettings() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 8),
        
//         // Privacy Options
//         const Text(
//           'Privacy Options',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 12),
        
//         // Checkboxes
//         _buildCheckboxOption(
//           'Option 1',
//           option1Selected,
//           (value) => setState(() => option1Selected = value ?? false),
//         ),
//         _buildCheckboxOption(
//           'Option 2',
//           option2Selected,
//           (value) => setState(() => option2Selected = value ?? false),
//         ),
//         _buildCheckboxOption(
//           'Option 3',
//           option3Selected,
//           (value) => setState(() => option3Selected = value ?? false),
//         ),
        
//         const SizedBox(height: 16),
        
//         // Update Button
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//               onPressed: () {},
//               child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
//             ),
//             const SizedBox(width: 8),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//               child: const Text('Update'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildAdditionalInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         const SizedBox(height: 16),
//         Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade100,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Column(
//             children: const [
//               Icon(
//                 Icons.info_outline,
//                 size: 48,
//                 color: Colors.grey,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Additional information about group settings',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         const SizedBox(height: 8),
//         TextField(
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4),
//               borderSide: BorderSide(color: Colors.grey.shade300),
//             ),
//             contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildToggleOption(String title, bool value, Function(bool) onChanged) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Row(
//         children: [
//           Icon(
//             value ? Icons.check_circle : Icons.check_circle_outline,
//             color: value ? Colors.blue : Colors.grey,
//             size: 20,
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: const TextStyle(fontSize: 14),
//             ),
//           ),
//           Switch(
//             value: value,
//             onChanged: onChanged,
//             activeColor: Colors.blue,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCheckboxOption(String title, bool value, Function(bool?) onChanged) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//           Checkbox(
//             value: value,
//             onChanged: onChanged,
//             activeColor: Colors.blue,
//           ),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
// }