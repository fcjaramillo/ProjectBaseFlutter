import 'package:equatable/equatable.dart';

class CitizenInvestment extends Equatable {
  const CitizenInvestment({
    required this.sessionId,
    this.id,
    this.totalBudget = 830000000000,
    this.totalInvested = 0,
    this.ipAddress,
    this.userAgent,
    this.items,
    this.createdAt,
  });

  factory CitizenInvestment.fromJson(Map<String, dynamic> json) =>
      CitizenInvestment(
        id: json['id'] as String?,
        sessionId: json['session_id'] as String,
        totalBudget: json['total_budget'] as int? ?? 830000000000,
        totalInvested: json['total_invested'] as int? ?? 0,
        ipAddress: json['ip_address'] as String?,
        userAgent: json['user_agent'] as String?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
      );

  final String? id;
  final String sessionId;
  final int totalBudget;
  final int totalInvested;
  final String? ipAddress;
  final String? userAgent;
  final List<CitizenInvestmentItem>? items;
  final DateTime? createdAt;

  int get remainingBudget => totalBudget - totalInvested;
  double get percentUsed => (totalInvested / totalBudget) * 100;

  String get formattedBudget => _formatCurrency(totalBudget);
  String get formattedInvested => _formatCurrency(totalInvested);
  String get formattedRemaining => _formatCurrency(remainingBudget);

  String _formatCurrency(int amount) {
    final String amountString = amount.toString();
    final StringBuffer buffer = StringBuffer();
    int count = 0;

    for (int i = amountString.length - 1; i >= 0; i--) {
      buffer.write(amountString[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }

    return '\$${buffer.toString().split('').reversed.join('')}';
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (id != null) 'id': id,
        'session_id': sessionId,
        'total_budget': totalBudget,
        'total_invested': totalInvested,
        'ip_address': ipAddress,
        'user_agent': userAgent,
        'created_at': createdAt?.toIso8601String(),
      };

  Map<String, dynamic> toInsertJson() => <String, dynamic>{
        'session_id': sessionId,
        'total_budget': totalBudget,
        'total_invested': totalInvested,
        'ip_address': ipAddress,
        'user_agent': userAgent,
      };

  CitizenInvestment copyWith({
    String? id,
    String? sessionId,
    int? totalBudget,
    int? totalInvested,
    String? ipAddress,
    String? userAgent,
    List<CitizenInvestmentItem>? items,
    DateTime? createdAt,
  }) =>
      CitizenInvestment(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        totalBudget: totalBudget ?? this.totalBudget,
        totalInvested: totalInvested ?? this.totalInvested,
        ipAddress: ipAddress ?? this.ipAddress,
        userAgent: userAgent ?? this.userAgent,
        items: items ?? this.items,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => <Object?>[
        id,
        sessionId,
        totalBudget,
        totalInvested,
        ipAddress,
        userAgent,
        items,
        createdAt,
      ];
}

class CitizenInvestmentItem extends Equatable {
  const CitizenInvestmentItem({
    required this.projectId,
    required this.quantity,
    required this.subtotal,
    this.id,
    this.investmentId,
    this.createdAt,
  });

  factory CitizenInvestmentItem.fromJson(Map<String, dynamic> json) =>
      CitizenInvestmentItem(
        id: json['id'] as String?,
        investmentId: json['investment_id'] as String?,
        projectId: json['project_id'] as String,
        quantity: json['quantity'] as int,
        subtotal: json['subtotal'] as int,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
      );

  final String? id;
  final String? investmentId;
  final String projectId;
  final int quantity;
  final int subtotal;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (id != null) 'id': id,
        if (investmentId != null) 'investment_id': investmentId,
        'project_id': projectId,
        'quantity': quantity,
        'subtotal': subtotal,
        'created_at': createdAt?.toIso8601String(),
      };

  Map<String, dynamic> toInsertJson(String investmentId) => <String, dynamic>{
        'investment_id': investmentId,
        'project_id': projectId,
        'quantity': quantity,
        'subtotal': subtotal,
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        investmentId,
        projectId,
        quantity,
        subtotal,
        createdAt,
      ];
}
