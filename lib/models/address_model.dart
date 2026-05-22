enum AddressType { home, work, other }

class AddressModel {
  final String id;
  final String label;
  final String firstLine;
  final String secondLine;

  final String phone;
  final AddressType type;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.label,
    required this.firstLine,
    required this.phone,
    required this.type,
    required this.secondLine,
    required this.isDefault,
  });

  String get typeString => type.name;
}
