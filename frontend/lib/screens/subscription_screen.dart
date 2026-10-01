import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    super.key,
    required this.onOpenAiChat,
  });

  final VoidCallback onOpenAiChat;

  static const purple = Color(0xFF4D21D1);
  static const lightPurple = Color(0xFFEDE7FF);
  static const background = Color(0xFFF9F7FC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildCurrentPlan(context),
                  const SizedBox(height: 20),
                  _buildAiInsight(context),
                  const SizedBox(height: 24),
                  _buildAvailableTiers(context),
                  const SizedBox(height: 18),
                  _buildPolicyFooter(context),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: lightPurple,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.auto_awesome_rounded,
                  color: purple,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SubClarity AI',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      'Subscription',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0EEF4),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 13,
                      color: purple,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'PROTECTED',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .7,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: purple,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outline_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subscription',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: -.6,
                          ),
                    ),
                    Text(
                      'Your plan, made clear.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: lightPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      size: 14,
                      color: purple,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Policy-aware',
                      style: TextStyle(
                        color: purple,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPlan(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: lightPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      size: 12,
                      color: purple,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'CURRENT PLAN',
                      style: TextStyle(
                        fontSize: 9,
                        color: purple,
                        fontWeight: FontWeight.w800,
                        letterSpacing: .7,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F0F5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 7,
                      color: Color(0xFF7353E8),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Active',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            'Premium',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: -.8,
                ),
          ),
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹499',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: purple,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1.5,
                    ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 9, left: 4),
                child: Text(
                  '/month',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 9),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F1F6),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.event_available_outlined,
                      size: 18,
                      color: purple,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Next billing: ',
                      style: TextStyle(fontSize: 11),
                    ),
                    const Text(
                      '15 October 2026',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Day 12 of 30',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.black.withOpacity(.55),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Text(
                      'Cycle started Sep 15',
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.black.withOpacity(.6),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '18 days left',
                      style: TextStyle(
                        fontSize: 9,
                        color: purple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _feature('4K Ultra HD streaming'),
          _feature('4 concurrent devices'),
          _feature('Priority customer support'),
          _feature('AI-powered subscription clarity', ai: true),
          const SizedBox(height: 18),
          Text(
            'Manage plan',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            'AI explains consequences before any change',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black54,
                  fontSize: 10,
                ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  context,
                  icon: Icons.pause_circle_outline_rounded,
                  label: 'Pause',
                  sublabel: '2 mos rest',
                  color: const Color(0xFFFFE6DA),
                  iconColor: const Color(0xFFB94B28),
                  onTap: () => _showActionExplanation(
                    context,
                    action: 'Pause',
                    title: 'Before you pause',
                    message:
                        'Your Premium subscription will be temporarily paused for 2 months. Your current access and saved preferences will remain according to the pause policy.',
                    date: '15 December 2026',
                    source: 'Subscription Policy v2.1',
                    confirmText: 'Confirm Pause',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _actionButton(
                  context,
                  icon: Icons.cancel_outlined,
                  label: 'Cancel',
                  sublabel: 'Stop renew',
                  color: const Color(0xFFFFE0DE),
                  iconColor: const Color(0xFFC74343),
                  onTap: () => _showActionExplanation(
                    context,
                    action: 'Cancel',
                    title: 'Before you cancel',
                    message:
                        'Your Premium subscription is ₹499/month and is scheduled to renew on 15 October 2026. Cancelling stops future renewal charges according to the current cancellation policy.',
                    date: '15 October 2026',
                    source: 'Cancellation Policy v2.1',
                    confirmText: 'Confirm Cancellation',
                    destructive: true,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _actionButton(
                  context,
                  icon: Icons.autorenew_rounded,
                  label: 'Renew',
                  sublabel: 'Extend plan',
                  color: const Color(0xFFE8E0FF),
                  iconColor: purple,
                  onTap: () => _showActionExplanation(
                    context,
                    action: 'Renew',
                    title: 'Before you renew',
                    message:
                        'Your Premium subscription will continue at ₹499/month. Your next billing date is 15 October 2026. Renewing keeps your subscription active according to the current renewal policy.',
                    date: '15 October 2026',
                    source: 'Renewal Policy v2.1',
                    confirmText: 'Confirm Renewal',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E7EC),
              borderRadius: BorderRadius.circular(22),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.shield_outlined,
                  size: 15,
                  color: purple,
                ),
                SizedBox(width: 7),
                Expanded(
                  child: Text(
                    'Tapping any action opens an AI policy explanation before completion. No instant charges or terminations.',
                    style: TextStyle(
                      fontSize: 9,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _feature(String text, {bool ai = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
              color: ai ? lightPurple : const Color(0xFFEAE7F2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              ai ? Icons.auto_awesome_rounded : Icons.check_rounded,
              size: 10,
              color: purple,
            ),
          ),
          const SizedBox(width: 9),
          Text(
            text,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String sublabel,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 4,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 19,
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                sublabel,
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAiInsight(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 13),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7654F4),
            Color(0xFF6240E7),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: purple.withOpacity(.22),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 7),
              Text(
                'AI Plan Insight',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          const Text(
            'Need a pause? Tap Pause to review how a 2-month billing hold keeps your grandfathered rate and protects watch history without recurring costs.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 11),
          Row(
            children: [
              const Text(
                'ZERO DARK PATTERNS GUARANTEE',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 7,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .6,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Preview logic',
                  style: TextStyle(
                    color: purple,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableTiers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Available Tiers',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const Spacer(),
            const Text(
              'Compare terms',
              style: TextStyle(
                color: purple,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _planCard(
          context,
          title: 'Basic',
          subtitle: 'Essential streaming',
          price: '₹199',
          features: [
            'HD streaming (720p)',
            '1 active device',
            'Basic email support',
          ],
          buttonText: 'Switch to Basic',
        ),
        const SizedBox(height: 14),
        _planCard(
          context,
          title: 'Standard',
          subtitle: 'Most balanced pick',
          price: '₹349',
          features: [
            'Full HD streaming (1080p)',
            '2 concurrent devices',
            'Standard support queue',
          ],
          buttonText: 'Switch to Standard',
        ),
        const SizedBox(height: 14),
        _planCard(
          context,
          title: 'Family',
          subtitle: 'Shared freedom',
          price: '₹699',
          badge: 'High Value',
          features: [
            '4K Ultra HD + Dolby Atmos',
            '6 concurrent household devices',
            'Family profiles & parental controls',
            'Priority support line',
          ],
          buttonText: 'Upgrade to Family',
          highlighted: true,
        ),
      ],
    );
  }

  Widget _planCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String price,
    required List<String> features,
    required String buttonText,
    String? badge,
    bool highlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.055),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (badge != null) ...[
                      const SizedBox(width: 7),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFDCD3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: highlighted ? purple : Colors.black,
                    ),
                  ),
                  const Text(
                    '/ month',
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 9,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 14,
                    color: purple,
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: highlighted
                    ? purple
                    : const Color(0xFFE9E7EC),
                foregroundColor:
                    highlighted ? Colors.white : purple,
                elevation: highlighted ? 2 : 0,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicyFooter(BuildContext context) {
    return const Center(
      child: Text(
        'All adjustments governed by Subscription Policy v2.1 •\nZero dark patterns',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 8,
          color: Colors.black54,
          height: 1.4,
        ),
      ),
    );
  }

  Future<void> _showActionExplanation(
    BuildContext context, {
    required String action,
    required String title,
    required String message,
    required String date,
    required String source,
    required String confirmText,
    bool destructive = false,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: lightPurple,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        color: purple,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SubClarity AI',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'AI-powered • Policy-aware',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -.5,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F1FA),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        action == 'Pause'
                            ? 'Billing resumes'
                            : action == 'Renew'
                                ? 'Next billing'
                                : 'Current renewal',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: purple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      size: 15,
                      color: Colors.black54,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Source: $source',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$action confirmed'),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          destructive ? const Color(0xFFD94B4B) : purple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(confirmText),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Keep Current Subscription',
                      style: TextStyle(
                        color: purple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}