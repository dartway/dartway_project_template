import 'package:dartway_app/dartway_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:project_name_client/project_name_client.dart';
import 'package:project_name_flutter/ui_kit/ui_kit.dart';

class ProfileSettingsWidget extends HookWidget {
  const ProfileSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize form fields with default values
    final firstNameController = useTextEditingController(text: '');
    final selectedGender = useState<UserGender?>(null);

    // Track original values to detect changes
    final originalFirstName = useRef<String>('');
    final originalGender = useRef<UserGender?>(null);

    // Track if any changes have been made
    final hasChanges = useState<bool>(false);

    // Update hasChanges whenever form values change
    useEffect(() {
      void checkForChanges() {
        final currentFirstName = firstNameController.text;
        final currentGender = selectedGender.value;

        final firstNameChanged = currentFirstName != originalFirstName.value;
        final genderChanged = currentGender != originalGender.value;

        hasChanges.value = firstNameChanged || genderChanged;
      }

      firstNameController.addListener(checkForChanges);
      selectedGender.addListener(checkForChanges);

      return () {
        firstNameController.removeListener(checkForChanges);
        selectedGender.removeListener(checkForChanges);
      };
    }, []);

    // Save changes function
    void saveChanges() {
      // TODO: Implement actual save logic here
      // For now, just show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Changes saved successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Update original values to current values
      originalFirstName.value = firstNameController.text;
      originalGender.value = selectedGender.value;
      hasChanges.value = false;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText.title('Profile Settings'),
          const Gap(24),

          // First Name Field
          AppTextFormField(
            value: firstNameController.text,
            onChanged: (value) => firstNameController.text = value,
            labelText: 'First Name',
            hintText: 'Enter your first name',
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'First name is required';
              }
              return null;
            },
          ),

          const Gap(16),

          // Gender Selector
          const AppText.body('Gender'),
          const Gap(8),
          DropdownButtonFormField<UserGender>(
            value: selectedGender.value,
            onChanged: (UserGender? newValue) {
              selectedGender.value = newValue;
            },
            decoration: const InputDecoration(
              hintText: 'Select your gender',
              border: OutlineInputBorder(),
            ),
            items: UserGender.values
                .map<DropdownMenuItem<UserGender>>((UserGender gender) {
              return DropdownMenuItem<UserGender>(
                value: gender,
                child: Text(gender.name.toUpperCase()),
              );
            }).toList(),
          ),

          const Gap(24),

          // Save Button (only shows when there are changes)
          if (hasChanges.value) ...[
            AppButton.primary(
              'Save Changes',
              dwCallback: DwCallback.create(saveChanges),
            ),
            const Gap(16),
          ],
        ],
      ),
    );
  }
}
