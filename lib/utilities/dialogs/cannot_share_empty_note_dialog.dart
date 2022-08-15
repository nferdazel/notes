import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<void> showCannotShareEmptyNoteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Sharingg',
    content: 'You cannot share an empty note!',
    optionsBuilder: () => {'OK': null},
  );
}
