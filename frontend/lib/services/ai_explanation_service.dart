class AiExplanationResponse {
  final String title;
  final String summary;
  final List<String> bullets;

  const AiExplanationResponse({
    required this.title,
    required this.summary,
    required this.bullets,
  });
}

class AiCancellationService {
  const AiCancellationService();

  AiExplanationResponse getWhyExplanation({
    required String planName,
    required String amount,
    required String renewalDate,
  }) {
    return AiExplanationResponse(
      title: 'Why this cancellation is the right choice',
      summary:
          'Your $planName plan renews at $amount per month. The current policy says the renewal is scheduled to continue until $renewalDate unless you explicitly cancel before the next billing cycle. Pausing can keep your preferences and saved watchlist while stopping charges temporarily.',
      bullets: [
        'The current term ends on $renewalDate and no future debits continue after cancellation.',
        'Your access remains active until the end of the current cycle, even after you confirm cancellation.',
        'A pause is a billing hold, whereas cancellation ends future renewals under the current policy.',
      ],
    );
  }
}
