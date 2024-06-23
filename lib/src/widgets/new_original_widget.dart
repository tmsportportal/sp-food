// import 'package:flutter/material.dart';
// import 'package:sportportal_food/src/core/l10n/app_localizations_context.dart';
//
// class NewOriginalWidget extends StatelessWidget {
//   final bool isOriginal;
//   final bool isNew;
//   const NewOriginalWidget(
//       {super.key, this.isOriginal = false, this.isNew = false});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Row(
//       children: [
//         if (isNew)
//           Container(
//             padding: const EdgeInsets.all(5.0),
//             color: theme.colorScheme.tertiary,
//             child: Text(
//               context.loc.newItem.toUpperCase(),
//               style: theme.textTheme.bodySmall?.copyWith(
//                 color: theme.colorScheme.onTertiary,
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         if (isOriginal)
//           Container(
//             padding: const EdgeInsets.all(5.0),
//             color: const Color(0xFF00843D).withOpacity(0.2),
//             child: Text(
//               context.loc.original.toUpperCase(),
//               style: theme.textTheme.bodySmall?.copyWith(
//                 color: const Color(0xFF00843D),
//                 fontSize: 12.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
