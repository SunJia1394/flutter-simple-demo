import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOptionsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> options;
  final ValueChanged<int> onOptionSelected;
  final int isSelected;

  const MyOptionsWidget({
    required this.options,
    required this.isSelected,
    required this.onOptionSelected,
  });

  Widget _buildOption(
      BuildContext context,
      String label,
      dynamic price,
      String url,
      Map<String, dynamic> body,
      bool isSelected
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ]
            : [],
      ),
      margin: EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          int selectedIndex = options.indexWhere((option) => option['label'] == label);
          onOptionSelected(selectedIndex);
        },
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(url),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '$price 货币',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        children: List.generate(options.length, (index) {
          return _buildOption(
            context,
            options[index]['label'],
            options[index]['url'],
            options[index]['image'],
            options[index]['body'],
              isSelected == index
          );
        }),
      ),
    );
  }
}