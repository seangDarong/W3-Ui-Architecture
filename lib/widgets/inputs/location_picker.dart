import 'package:blabla/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../../model/ride/locations.dart';
import '../../services/locations_service.dart';

class LocationPicker extends StatefulWidget {
  final Location? selectedLocation;
  const LocationPicker({this.selectedLocation, super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late TextEditingController _searchController;
  late List<Location> _filteredLocations;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredLocations = LocationsService.availableLocations;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterLocations(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLocations = LocationsService.availableLocations;
      } else {
        _filteredLocations = LocationsService.availableLocations
            .where((location) => location.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: () => Navigator.pop(context),
                    ),

                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        onChanged: _filterLocations,
                        decoration: const InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (_searchController.text.isNotEmpty)
                      IconButton(
                        onPressed: _searchController.clear,
                        icon: Icon(Icons.clear),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = _filteredLocations[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(location.name,style: BlaTextStyles.body.copyWith(color: BlaColors.neutralDark,)),
                        subtitle: Text(location.country.name,style: BlaTextStyles.label.copyWith(color: BlaColors.neutralLight,)),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => Navigator.pop(context,location),
                      ),
                      BlaDivider()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
