import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:venuze_dev/core/constants/app_assets.dart';
import 'package:venuze_dev/core/theme/app_text_styles.dart';

class CaptchaCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CaptchaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [
            // Flutter checkbox
            Checkbox(value: value, onChanged: onChanged, visualDensity: VisualDensity.compact,),

            Text("I'm not a robot", style: AppTextStyles.bodyText),

            const Spacer(),
            SvgPicture.asset(AppAssets.capchaSvg),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
