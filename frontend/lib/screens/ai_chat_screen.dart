import 'package:flutter/material.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final _controller = TextEditingController();

  final List<_ChatMessage> _messages = [
    const _ChatMessage(
      text:
          'Hi! I can explain your subscription, billing, pause, cancellation, and renewal policies in simple terms.',
      isAi: true,
    ),
  ];

  static const purple = Color(0xFF4D21D1);

  void _sendMessage([String? predefined]) {
    final text = (predefined ?? _controller.text).trim();

    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        _ChatMessage(
          text: text,
          isAi: false,
        ),
      );

      _messages.add(
        _ChatMessage(
          text: _generateResponse(text),
          isAi: true,
        ),
      );
    });

    _controller.clear();
  }

  String _generateResponse(String question) {
    final q = question.toLowerCase();

    if (q.contains('pause')) {
      return 'Pausing temporarily suspends your subscription according to the selected pause period. It does not permanently cancel the subscription. For your Premium plan, the selected 2-month pause would resume billing after the pause period.\n\nSource: Subscription Policy v2.1';
    }

    if (q.contains('cancel')) {
      return 'Cancellation stops future renewal charges according to the cancellation policy. Your current access continues according to the terms of your current billing cycle.\n\nSource: Cancellation Policy v2.1';
    }

    if (q.contains('charge') || q.contains('billing')) {
      return 'Your Premium plan costs ₹499/month. Your current billing date is 15 October 2026. Subscription actions are explained before confirmation so there are no unexpected changes.\n\nSource: Billing Policy v2.1';
    }

    if (q.contains('renew')) {
      return 'Renewing keeps your Premium subscription active at ₹499/month. Your next billing date is 15 October 2026.\n\nSource: Renewal Policy v2.1';
    }

    return 'Based on your current Premium subscription, I can explain how pause, cancellation, renewal, billing, and access work. Try asking about one of these actions.\n\nSource: Subscription Policy v2.1';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE7FF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: purple,
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SubClarity AI',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Policy-aware assistant',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildContextCard(),
          _buildSuggestions(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildContextCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.credit_card_rounded,
            color: purple,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current subscription',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Premium • ₹499/month',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Next billing',
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.black54,
                ),
              ),
              Text(
                '15 Oct 2026',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestions() {
    final suggestions = [
      'What happens if I pause?',
      'Pause vs cancellation?',
      'When will I be charged?',
    ];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: suggestions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          return ActionChip(
            onPressed: () => _sendMessage(suggestions[index]),
            avatar: const Icon(
              Icons.auto_awesome_rounded,
              size: 14,
              color: purple,
            ),
            label: Text(
              suggestions[index],
              style: const TextStyle(fontSize: 10),
            ),
            backgroundColor: const Color(0xFFEDE7FF),
            side: BorderSide.none,
          );
        },
      ),
    );
  }

  Widget _buildMessage(_ChatMessage message) {
    return Align(
      alignment:
          message.isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 330),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: message.isAi
              ? Colors.white
              : const Color(0xFFE7DEFF),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.isAi)
              const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      size: 14,
                      color: purple,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'SubClarity AI',
                      style: TextStyle(
                        color: purple,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            Text(
              message.text,
              style: const TextStyle(
                fontSize: 12,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendMessage(),
                decoration: InputDecoration(
                  hintText: 'Ask about your subscription...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.auto_awesome_outlined,
                    color: purple,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: purple,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () => _sendMessage(),
                icon: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  const _ChatMessage({
    required this.text,
    required this.isAi,
  });

  final String text;
  final bool isAi;
}