
import 'package:expenso_341/ui/statistics.dart';
import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  List<Map<String, dynamic>> expenses = [
    {"date": "Tuesday, 14", "title": "Shop", "desc": "Buy new clothes", "amount": 90},
    {"date": "Tuesday, 14", "title": "Electronic", "desc": "Buy new iPhone", "amount": -1290},
    {"date": "Monday, 13", "title": "Transportation", "desc": "Trip to Malang", "amount": -60},
  ];

  String selectedFilter = "This month";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/U2.png",
                  height: 40,
                  width: 40,
                ),
                SizedBox(width: 20),
                Text(
                  "Monety",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(width: 600),
                Icon(Icons.search, size: 28),
              ],
            ),
            const SizedBox(height: 20),

            // Greeting and Filter Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Morning", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/U4.png",
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          "Blaszczykowski",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                DropdownButton<String>(
                  value: selectedFilter,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                  items: <String>["This month", "Last month", "This week"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Expense Total Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF727DD6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Expense total", style: TextStyle(color: Colors.white, fontSize: 16)),
                      const SizedBox(height: 8),
                      Text("\$3,734",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "+\$240",
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("than last month", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/u5.png",
                    height: 120,
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Expense List Title
            Text(
              "Expense List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Expense List
            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to StatisticPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage()
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(expense["date"],
                                  style: TextStyle(fontSize: 14, color: Colors.grey)),
                              const SizedBox(height: 5),
                              Text(expense["title"],
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(expense["desc"],
                                  style: TextStyle(fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "\$${expense["amount"]}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: expense["amount"] < 0 ? Colors.red : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Statistics")),
      body: Center(
        child: Text(
          "Statistic Page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
