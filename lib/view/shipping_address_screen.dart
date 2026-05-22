import 'package:ecom1_frontend/models/address_model.dart';
import 'package:ecom1_frontend/repositories/address_repository.dart';
import 'package:ecom1_frontend/utils/app_text_styles_util.dart';
import 'package:ecom1_frontend/view/size_selector.dart';
import 'package:ecom1_frontend/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressScreen extends StatelessWidget {
  final AddressRepository _addressRepository = AddressRepository();
  ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final addresses = _addressRepository.getAddresses();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "Shipping Address",
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showEditBottomSheet(context, null),
            icon: Icon(
              Icons.add_circle_outline,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addresses.length,
        itemBuilder: (context, index) => _buildAddressItem(
          context,
          addresses[index],
          () => _showEditBottomSheet(context, addresses[index]),
          () => _showDeleteConfirmationDialog(context, addresses[index]),
        ),
      ),
    );
  }

  Widget _buildAddressItem(
    BuildContext context,
    AddressModel address,
    VoidCallback onEdit,
    VoidCallback onDelete,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            address.label,
                            style: AppTextStyle.withColor(
                              AppTextStyle.h3,
                              Theme.of(context).textTheme.bodyMedium!.color!,
                            ),
                          ),
                          if (address.isDefault) ...[
                            SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "Default",
                                style: AppTextStyle.withColor(
                                  AppTextStyle.bodySmallText,
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${address.firstLine} \n${address.secondLine}, ${address.phone}",
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyMediumText,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey.shade200),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onEdit,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Edit",
                          style: AppTextStyle.withColor(
                            AppTextStyle.bodyMediumText,
                            Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(width: 1, height: 24, color: Colors.grey.shade200),
              Expanded(
                child: InkWell(
                  onTap: onDelete,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red),
                        SizedBox(width: 8),
                        Text(
                          "Delete",
                          style: AppTextStyle.withColor(
                            AppTextStyle.bodyMediumText,
                            Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showEditBottomSheet(BuildContext context, AddressModel? address) {
    final addressTypes = ["home", "work", "other"];
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final TextEditingController labelController = TextEditingController(
      text: address?.label,
    );
    final TextEditingController firstLineController = TextEditingController(
      text: address?.firstLine,
    );
    final TextEditingController secondLineController = TextEditingController(
      text: address?.secondLine,
    );

    final TextEditingController phoneController = TextEditingController(
      text: address?.phone,
    );

    bool isDefault = address?.isDefault ?? false;

    Get.bottomSheet(
      isScrollControlled: true,
      StatefulBuilder(
        builder: (context, setStateLocal) {
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${address == null ? "Add" : "Edit"} Address",
                      style: AppTextStyle.withColor(
                        AppTextStyle.h3,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close,
                        color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Select type",
                  style: AppTextStyle.withColor(
                    AppTextStyle.labelText,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                ),
                SizedBox(height: 4),
                ValueSelector(
                  values: addressTypes,
                  initialValueIndex: addressTypes.indexOf(
                    address?.type.name ?? addressTypes[0],
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Label(e.g: Home, Work)",
                  prefixIcon: Icons.label_outline,
                  keyboardType: TextInputType.text,
                  controller: labelController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a label(e.g: Home, Work)";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "First line of address",
                  prefixIcon: Icons.location_on_outlined,
                  keyboardType: TextInputType.text,
                  controller: firstLineController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a first line of address";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),
                CustomTextField(
                  label: "Second line of address",
                  prefixIcon: Icons.location_on_outlined,
                  keyboardType: TextInputType.text,
                  controller: secondLineController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: "Phone Number",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).cardColor,
                  ),
                  child: ListTile(
                    title: Text(
                      "Is default",
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMediumText,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    trailing: Switch.adaptive(
                      value: isDefault,
                      onChanged: (value) => setStateLocal(() {
                        isDefault = value;
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _handleSaveAddress(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMediumText,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    AddressModel address,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Get.dialog(
      AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red[400]!.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                color: Colors.red[400],
                size: 32,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Remove address",
              style: AppTextStyle.withColor(
                AppTextStyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Are you sure you want to remove this address from your list ?",
              textAlign: TextAlign.center,
              style: AppTextStyle.withColor(
                AppTextStyle.bodyMediumText,
                isDark ? Colors.grey[400]! : Colors.grey[600]!,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.back(),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(
                        color: isDark ? Colors.white70 : Colors.black12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMediumText,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add delete logic here
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      padding: EdgeInsets.symmetric(vertical: 12),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Remove",
                      style: AppTextStyle.withColor(
                        AppTextStyle.bodyMediumText,
                        Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      barrierColor: Colors.black54,
    );
  }

  void _handleSaveAddress() {
    // save logic here
    Get.back();
  }
}
