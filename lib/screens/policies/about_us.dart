import 'package:flutter/material.dart';
import 'package:v1_micro_finance/configs/widgets/comon_appbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom app bar),
      appBar: const CommonAppBar(title: "About Us"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FINSYS: Your Ultimate Financial Growth and Security Platform',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'FINSYS is an innovative financial platform designed to help you save, grow, and access your money like never before. With unmatched features, advanced fund management strategies, and a commitment to security, FINSYS is transforming how you manage your finances.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildFeature(
              title: '1. Save Any Amount, Earn Daily Profits',
              description:
                  'No matter how small or large your savings, FINSYS rewards you with a 1% daily revenue on your saved amount. This means your money is constantly growing, creating a reliable stream of passive income every single day.',
            ),
            _buildFeature(
              title: '2. Withdraw Profits Every Day',
              description:
                  'Enjoy complete flexibility with your earnings! FINSYS allows you to withdraw your profits daily, giving you immediate access to the money you\'ve earned. Use it for personal expenses, reinvestments, or savings---your choice, your freedom.',
            ),
            _buildFeature(
              title: '3. Instant Loans Up to 80% of Your Savings',
              description:
                  'Need cash in a hurry? FINSYS offers instant loans of up to 80% of your saved amount. There\'s no need to worry about lengthy paperwork or approvals---your savings work as your collateral, giving you quick and seamless access to funds when you need them the most.',
            ),
            _buildFeature(
              title: '4. Advanced Investment Strategies',
              description:
                  'FINSYS takes your savings and invests them in diverse, high-potential stock markets and secure daily market opportunities. By partnering with expert fund managers and leveraging the latest financial tools, FINSYS ensures your money grows consistently while minimizing risks.',
            ),
            _buildFeature(
              title: '5. Support for High-Profit Enterprises',
              description:
                  'Beyond market investments, FINSYS lends to high-profit enterprises with strong growth potential. This not only generates higher returns for your savings but also contributes to the development of successful businesses.',
            ),
            _buildFeature(
              title: '6. Unmatched Fund Security',
              description:
                  'Your money is safe with FINSYS. We implement strict security protocols and advanced risk management systems to ensure your savings and investments are protected at all times. Transparency, reliability, and customer trust are at the core of everything we do.',
            ),
            _buildFeature(
              title: '7. Easy to Use, Anytime Access',
              description:
                  'FINSYS is built with convenience in mind. Whether you want to save, track your earnings, withdraw profits, or apply for loans, everything is available in just a few clicks through the app. Access your funds anytime, anywhere, with full control and visibility.',
            ),
            _buildFeature(
              title: '8. Perfect for Smart Savers and Investors',
              description:
                  'Whether you\'re saving for short-term goals or building long-term wealth, FINSYS adapts to your needs. Save small, grow big, and benefit from daily returns while enjoying the flexibility of instant withdrawals and loans.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Why Choose FINSYS?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildWhyChoosePoint(
                'Guaranteed Daily Revenue: Earn a steady 1% return on your savings.'),
            _buildWhyChoosePoint(
                'Instant Cash Access: Withdraw daily profits or secure loans without hassle.'),
            _buildWhyChoosePoint(
                'Smart Investments: Your savings are managed through diverse, secure, and high-growth strategies.'),
            _buildWhyChoosePoint(
                'Flexibility and Security: Your money is always accessible and protected by advanced systems.'),
            const SizedBox(height: 16),
            const Text(
              'FINSYS is more than a savings platform---it\'s your partner in financial freedom. Start saving today and experience a smarter way to grow your wealth.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build feature sections
  Widget _buildFeature({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Helper method to build "Why Choose FINSYS" list items
  Widget _buildWhyChoosePoint(String point) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(
            child: Text(
              point,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
