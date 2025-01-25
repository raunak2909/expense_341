import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatisticPage()),
            );
          },
          child: Text("Go to Statistic Page"),
        ),
      ),
    );
  }
}
class StatisticPage extends StatelessWidget {
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
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Statistic",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                DropdownButton<String>(
                  value: "This month",
                  onChanged: (String? newValue) {},
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
            const SizedBox(height: 20),

            // Total Expense Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF727DD6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total expense",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text("\$3,734 / \$5000 per month",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.white38,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Expense Breakdown Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Expense Breakdown",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: "Week",
                  onChanged: (String? newValue) {},
                  items: <String>["Week", "Month", "Year"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),

                ),

              ],
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 30),

            // Spending Details Section
            Text("Spending Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              "Your expenses are divided into 6 categories",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Categories Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpendingCard(
                  color: Colors.purpleAccent,
                  icon: Icons.shopping_bag,
                  title: "Shop",
                  amount: "-\$1190",
                ),
                SpendingCard(
                  color: Colors.orangeAccent,
                  icon: Icons.directions_bus,
                  title: "Transport",
                  amount: "-\$867",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SpendingCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String amount;

  const SpendingCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width * 0.42,
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
      child: Column(
        children: [
          Icon(icon, size: 36, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),

        ],
      ),
    );
  }
}
