import 'package:flutter/material.dart';

class EducationEntry extends StatelessWidget {
  final String degree;
  final String university;
  final String years;
  final String description;
  final Color textColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;

  const EducationEntry({
    Key? key,
    required this.degree,
    required this.university,
    required this.years,
    required this.description,
    required this.textColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepOrange.shade100, width: 2),
              ),
            ),
            Container(
              width: 2,
              height: 80,
              color: Colors.grey[300],
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                degree,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    university,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                  Text(
                    years,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: tertiaryTextColor,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}