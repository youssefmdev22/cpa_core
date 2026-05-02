import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cpa_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_cell_widget.dart';
import 'custom_data_grid_controller.dart';

class CustomDataGrid extends StatefulWidget {
  final CustomDataGridController controller;
  final bool isEditable;
  final bool isReorderable;
  final void Function(int oldIndex, int newIndex)? onReorder;

  const CustomDataGrid({
    super.key,
    required this.controller,
    this.isEditable = true,
    this.isReorderable = false,
    this.onReorder,
  });

  @override
  State<CustomDataGrid> createState() => _CustomDataGridState();
}

class _CustomDataGridState extends State<CustomDataGrid> {
  final ScrollController _horizontalController = ScrollController();

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: _horizontalController,
          thumbVisibility: true,
          trackVisibility: true,
          child: SingleChildScrollView(
            controller: _horizontalController,
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: SizedBox(
                width: constraints.maxWidth > 1000 ? constraints.maxWidth : 1000,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    if (widget.isReorderable)
                      _buildReorderableList(context)
                    else
                      _buildStaticList(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gray[130]!, width: 1),
        ),
      ),
      child: Row(
        children: [
          if (widget.isReorderable) const SizedBox(width: 40), // Space for drag handle
          ...widget.controller.columns.map(
            (c) => Expanded(
              flex: c.flex,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Text(
                  textAlign: TextAlign.center,
                  c.column.toUpperCase(),
                  style:
                      c.columnTextStyle?[0] ??
                      context.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray[70],
                        letterSpacing: 0.5,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaticList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.controller.rows.length,
      itemBuilder: (context, index) => _buildRow(context, index),
    );
  }

  Widget _buildReorderableList(BuildContext context) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.controller.rows.length,
      proxyDecorator: (child, index, animation) {
        return Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray[140],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 15,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: child,
          ),
        );
      },
      onReorder: (oldIndex, newIndex) {
        if (widget.onReorder != null) {
          widget.onReorder!(oldIndex, newIndex);
        }
      },
      itemBuilder: (context, index) => _buildRow(context, index),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    final row = widget.controller.rows[index];
    final isEven = index % 2 == 0;

    return Material(
      key: ValueKey(widget.isReorderable ? row.id : "row_$index"),
      color: Colors.transparent,
      child: InkWell(
        onHover: (hovering) {}, // Triggers hover state for Ink
        onTap: () {}, // Allows InkWell to show splash/hover color
        hoverColor: AppColors.mainColor[100], // Subtle green hover
        child: Container(
          decoration: BoxDecoration(
            color:
                isEven
                    ? Colors.transparent
                    : AppColors.gray[150]!.withValues(alpha: 0.3),
            border: Border(
              bottom: BorderSide(color: AppColors.gray[130]!, width: 1),
            ),
          ),
          child: Row(
            children: [
              if (widget.isReorderable)
                ReorderableDragStartListener(
                  index: index,
                  child: const SizedBox(
                    width: 40,
                    child: Icon(
                      Icons.drag_indicator,
                      color: AppColors.gray,
                      size: 20,
                    ),
                  ),
                ),
              ...widget.controller.columns.map(
                (c) => Expanded(
                  flex: c.flex,
                  child: CustomCellWidget(
                    cell: widget.isEditable ? row.getNotifier(c.column) : null,
                    value: row.cells[c.column] ?? "",
                    column: c,
                    index: index,
                    row: row,
                    isEditable: widget.isEditable,
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
