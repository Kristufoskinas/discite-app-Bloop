import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/models/summary_models.dart';
import 'package:project/screens/summary_data.dart';

class SummaryCard extends StatelessWidget {

  final SummaryData summaryCardData;

  SummaryCard(this.summaryCardData);

  @override
  Widget build(BuildContext context) {
    final String headerText = summaryCardData.title;
    final String authorText = summaryCardData.author;
    final String summaryText = summaryCardData.content; // pakeisti kad rodytu kelis zodzius

    return (Padding(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(22),
              child: InkWell(
                onTap: () => Navigator.of(context).pushNamed(SummaryDataScreen.routeName, arguments:
                  this.summaryCardData),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headerText,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 78, 152, 1),
                      thickness: 4,
                    ),
                    Text(authorText),
                    Text(
                      summaryText,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ])));
  }
}

class FullLineSummaryCard extends StatelessWidget {
  final String headerText;
  final Widget child;

  FullLineSummaryCard(this.headerText, this.child);

  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        child: Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
              ),
              padding: EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headerText,
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(0, 78, 152, 1),
                      thickness: 4,
                    ),
                    child,
                  ],
                ),
              ),
            ),
        ])));
  }
}