import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int likes = 25;
  int followers = 15;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {Navigator.pop(context);},
        ),
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with avatar, name and subtitle on a soft background
            Container(
              color: const Color(0xFFFFF1F7), // soft pink
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
              child: Column(
                children:  [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/image1.jpg")
            
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sophia',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Open to Global Opportunities. Bringing creativity and expertise to international projects',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.5,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Three stat cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Expanded(
                    child: _StatCard(
                      value: '8',
                      label: 'Certifications',
                      icon: Icons.check_circle_outline,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      value: '4.9',
                      label: 'Performance',
                      icon: Icons.star_rounded,
                      highlightIcon: true,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      value: '\$25',
                      label: 'Hourly Pricing',
                      icon: Icons.payments_outlined,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Like + Followers pill buttons
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _PillButton(
                    icon: Icons.thumb_up_alt_rounded,
                    label: 'Like',
                    onTap: () => setState(() => likes++),
                  ),
                  const SizedBox(width: 14),
                  _PillButton(
                    icon: Icons.person_add_alt_1_rounded,
                    label: 'Follow',
                    onTap: () => setState(() => followers++),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Center(
              child: Text(
                '$likes Likes    ·    $followers followers',
                style: const TextStyle(color: Colors.black54),
              ),
            ),

            const SizedBox(height: 20),

            // About section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'About Sophia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'I am a passionate Flutter developer who loves creating smooth, modern, and engaging mobile applications.'
                    'With a strong eye for design and functionality, I enjoy transforming ideas into real, usable apps that people love.'
                    'Building beautiful UIs and writing clean code is my biggest motivation.',
                    style: TextStyle(height: 1.45, fontSize: 14.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Details: Gender / Age / Experience
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                child: Column(
                  children: const [
                    _DetailRow(leftLabel: 'Gender', leftValue: 'Female', rightLabel: 'Age', rightValue: '25'),
                    Divider(height: 18),
                    _DetailRow(leftLabel: 'Experience', leftValue: '4 years', rightLabel: 'Location', rightValue: 'Chennai'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Expertise
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Expertise',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Flutter Developer, UI Designer',
                      style: TextStyle(color: Colors.black87, fontSize: 14.5),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------- small reusable widgets ---------- */

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final bool highlightIcon;

  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
    this.highlightIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EDFF), // soft lilac
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 22,
            color: highlightIcon ? Colors.amber[700] : cs.primary,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 13.5, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _PillButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PillButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Material(
      color: Colors.white,
      shape: const StadiumBorder(),
      elevation: 1,
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Icon(icon, size: 18, color: cs.primary),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: cs.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String leftLabel;
  final String leftValue;
  final String rightLabel;
  final String rightValue;

  const _DetailRow({
    required this.leftLabel,
    required this.leftValue,
    required this.rightLabel,
    required this.rightValue,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.black87,
    );
    TextStyle valueStyle = const TextStyle(color: Colors.black87);

    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: '$leftLabel: ', style: labelStyle),
                TextSpan(text: leftValue, style: valueStyle),
              ],
            ),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: '$rightLabel: ', style: labelStyle),
                TextSpan(text: rightValue, style: valueStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}