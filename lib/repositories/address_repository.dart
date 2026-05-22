import 'package:ecom1_frontend/models/address_model.dart';

class AddressRepository {
  List<AddressModel> getAddresses() {
    return [
      AddressModel(
        id: "1",
        label: "Home",
        firstLine: "123 Main St, Springfield, IL 62704",
        secondLine: "Springfield",
        phone: "555-123-4567",
        type: AddressType.home,
        isDefault: true,
      ),
      AddressModel(
        id: "2",
        label: "Work",
        firstLine: "456 Elm St, Springfield, IL 62701",
        secondLine: "Springfield",
        phone: "555-987-6543",
        type: AddressType.work,
        isDefault: false,
      ),
      AddressModel(
        id: "3",
        label: "Other",
        firstLine: "789 Oak St, Springfield, IL 62702",
        secondLine: "Springfield",
        phone: "555-555-5555",
        type: AddressType.other,
        isDefault: false,
      ),
    ];
  }

  AddressModel? getDefaultAddress() {
    return getAddresses().firstWhere(
      (address) => address.isDefault,
      orElse: () => getAddresses().first,
    );
  }
}
