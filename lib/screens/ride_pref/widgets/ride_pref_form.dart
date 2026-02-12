import 'package:blabla/theme/theme.dart';
import 'package:blabla/utils/date_time_util.dart';
import 'package:blabla/widgets/actions/bla_button.dart';
import 'package:blabla/widgets/display/bla_divider.dart';
import 'package:blabla/widgets/inputs/bla_input_tile.dart';
import 'package:blabla/widgets/inputs/location_picker.dart';
import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  //default text
  Location defaultDeparture = Location(
    name: 'Toulouse',
    country: Country.france,
  );
  final Location defaultArrival = Location(name: 'Bordeaux', country: Country.france);
  final DateTime defaultDate = DateTime.now();
  static const int defaultSeat = 1;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departure = widget.initRidePref?.departure ?? defaultDeparture;
    arrival = widget.initRidePref?.arrival ?? defaultArrival;
    departureDate = widget.initRidePref?.departureDate ?? defaultDate;
    requestedSeats = widget.initRidePref?.requestedSeats ?? defaultSeat;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void _switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  void _onSearch() {
    bool isValid = false;

    if (departure != null &&
        arrival != null &&
        departure != arrival &&
        requestedSeats >= 0) {
      isValid = true;
    }

    if(isValid){
      
    }
  }

  void _onDepartureTap() async {
    final Location? selected = await showDialog<Location>(
      context: context,
      builder: (context) => LocationPicker(
        selectedLocation: departure,
      ),
    );

    if (selected != null) {
      setState(() => departure = selected);
    }
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  Widget _buildDepartureTile() {
    return BlaInputTile(
          icon: Icons.radio_button_unchecked,
          title: departure?.name ?? 'Departure',
          onTap: _onDepartureTap,
          trailing: IconButton(
            icon: Icon(Icons.swap_vert, color: BlaColors.primary),
            onPressed: _switchLocations,
          ),
        );
  }

  Widget _buildArrivalTile() {
    return BlaInputTile(
          icon: Icons.radio_button_unchecked,
          title: arrival?.name ?? 'Arrival',
          onTap: () {
            
          },
        );
  }

  Widget _buildDateTile() {
    return BlaInputTile(
          icon: Icons.calendar_month_outlined,
          title: DateTimeUtils.formatDateTime(departureDate),
          onTap: () {
          },
        );
  }

  Widget _buildSeatsTile() {
    return BlaInputTile(
          icon: Icons.person,
          title: requestedSeats.toString(),
          onTap: () {
            
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildDepartureTile(),
        const BlaDivider(),
        _buildArrivalTile(),
        const BlaDivider(),
        _buildDateTile(),
        const BlaDivider(),
        _buildSeatsTile(),
        SizedBox(height: BlaSpacings.m),
        BlaButton(
          label: 'Search',
          buttonType: ButtonType.primary,
          onButtonClick: _onSearch,
        ),
      ],
    );
  }
}
