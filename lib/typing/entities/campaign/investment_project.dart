import 'package:equatable/equatable.dart';

class InvestmentProject extends Equatable {
  const InvestmentProject({
    required this.id,
    required this.name,
    required this.unitCost,
    this.description,
    this.unitName,
    this.icon,
    this.category,
    this.maxQuantity = 100,
    this.sortOrder = 0,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  factory InvestmentProject.fromJson(Map<String, dynamic> json) =>
      InvestmentProject(
        id: json['id'] as String,
        name: json['name'] as String,
        unitCost: json['unit_cost'] as int,
        description: json['description'] as String?,
        unitName: json['unit_name'] as String?,
        icon: json['icon'] as String?,
        category: json['category'] as String?,
        maxQuantity: json['max_quantity'] as int? ?? 100,
        sortOrder: json['sort_order'] as int? ?? 0,
        isActive: json['is_active'] as bool? ?? true,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
      );

  final String id;
  final String name;
  final int unitCost;
  final String? description;
  final String? unitName;
  final String? icon;
  final String? category;
  final int maxQuantity;
  final int sortOrder;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  String get formattedCost {
    final String costString = unitCost.toString();
    final StringBuffer buffer = StringBuffer();
    int count = 0;

    for (int i = costString.length - 1; i >= 0; i--) {
      buffer.write(costString[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write('.');
      }
    }

    return '\$${buffer.toString().split('').reversed.join('')}';
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'unit_cost': unitCost,
        'description': description,
        'unit_name': unitName,
        'icon': icon,
        'category': category,
        'max_quantity': maxQuantity,
        'sort_order': sortOrder,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        unitCost,
        description,
        unitName,
        icon,
        category,
        maxQuantity,
        sortOrder,
        isActive,
        createdAt,
        updatedAt,
      ];
}
