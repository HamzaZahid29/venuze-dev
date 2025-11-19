import 'package:flutter/material.dart';
import 'package:venuze_dev/core/theme/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(),
        const Expanded(child: Divider(thickness: 1, color: Colors.black12)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("or continue with", style: AppTextStyles.caption),
        ),
        const Expanded(child: Divider(thickness: 1, color: Colors.black12)),
        SizedBox(),
      ],
    );
  }
}
