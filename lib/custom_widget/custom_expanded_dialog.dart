import 'package:flutter/material.dart';

import '../cpa_core.dart';
import '../generated/l10n.dart';

Future customExpandedDialog({
  required BuildContext context,
  required Widget child,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: CoreLocalizations.of(context).customExpandedDialog,
    barrierColor: AppColors.black.withAlpha(70),
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomExpandedDialogContent(child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: child,
        ),
      );
    },
  );
}

class CustomExpandedDialogContent extends StatefulWidget {
  final Widget child;

  const CustomExpandedDialogContent({super.key, required this.child});

  @override
  State<CustomExpandedDialogContent> createState() =>
      _CustomExpandedDialogContent();
}

class _CustomExpandedDialogContent extends State<CustomExpandedDialogContent> {
  bool isMaximized = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = isMaximized ? size.width : size.width * 0.8;
    final height = isMaximized ? size.height : size.height * 0.8;

    return SafeArea(
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.2,
                colors: [AppColors.bgColor[20]!, AppColors.black],
                stops: const [0.0, 1.0],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isMaximized ? 0 : 24),
              child: Column(
                children: [
                  // Premium Header
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgColor[10],
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.gray.withAlpha(50),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      spacing: 8,
                      children: [
                        _ActionButton(
                          icon: isMaximized
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          onTap: () =>
                              setState(() => isMaximized = !isMaximized),
                          tooltip: isMaximized
                              ? CoreLocalizations.of(context).minimize
                              : CoreLocalizations.of(context).maximize,
                        ),
                        _ActionButton(
                          icon: Icons.close,
                          onTap: () => Navigator.of(context).pop(),
                          tooltip: CoreLocalizations.of(context).close,
                          color: Colors.redAccent.withAlpha(25),
                          iconColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: widget.child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;
  final Color? color;
  final Color? iconColor;

  const _ActionButton({
    required this.icon,
    required this.onTap,
    required this.tooltip,
    this.color,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? AppColors.gray.withAlpha(10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor ?? AppColors.white, size: 20),
      ).applyBounceable(onTap: onTap),
    );
  }
}
