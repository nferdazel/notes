import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content: 'We\'ve sent you a password reset link. Please check your email.',
    optionsBuilder: () => {'OK': null},
  );
}
