import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: (data['correct_answer'] == data['user_answer'])
                          ? const Color.fromARGB(255, 255, 232, 23)
                          : const Color.fromARGB(255, 208, 17, 201),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: (data['correct_answer'] != data['user_answer'])
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18),
                          textAlign: TextAlign.left),
                      const SizedBox(height: 5),
                      Text(data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 208, 17, 201),
                              fontSize: 14),
                          textAlign: TextAlign.left),
                      Text(data['user_answer'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 255, 232, 23),
                              fontSize: 14),
                          textAlign: TextAlign.left),
                      const SizedBox(height: 20)
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
