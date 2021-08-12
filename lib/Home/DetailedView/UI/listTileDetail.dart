import 'package:flutter/material.dart';
import 'package:personal_schedular/config/Theme/sizes_helper.dart';

class ListTileDetail extends StatelessWidget {
  final IconData _icon;
  final String? _title;
  final double _fontSize;
  final Color _textColor;
  final Color _iconColor;
  final Color _iconBgColor;

  ListTileDetail(this._icon, this._title, this._fontSize, this._textColor,
      this._iconColor,this._iconBgColor);

  @override
  Widget build(BuildContext context) {
    double width = setWidth(context);
    double height = setHeight(context);
    return ListTile(
      contentPadding: EdgeInsets.only(left: width * 0.09, right: width * 0.05),
      leading: Container(
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
            color: _iconBgColor,
            borderRadius: BorderRadius.all(Radius.circular(width * 0.03))),
        child: Icon(
          _icon,
          color: _iconColor,
          semanticLabel: _title,
        ),
      ),
      title: Text(
        _title.toString(),
        style: TextStyle(
          fontSize: _fontSize,
          color: _textColor,
        ),
      ),
    );
  }
}
