import 'package:flutter_test/flutter_test.dart';
import 'package:blabla/services/rides_service.dart';
import 'package:blabla/dummy_data/dummy_data.dart';


void main() {
  RidesService.availableRides = fakeRides;

  test('filter rides by departure lication', () {
    final location = fakeRides.first.departureLocation;
    final result = RidesService.filterBy(departure: location);

    expect(result.isNotEmpty, true);
    expect(result.every((ride) => ride.departureLocation == location), true);
  });

  test('filter rides with enough available seat', () {
    const requestedSeats = 1;
    final result = RidesService.filterBy(seatRequested: requestedSeats);
    expect(result.isNotEmpty, true);
    expect(result.first.availableSeats >= requestedSeats, true);
  });

  test('filter rides with departure location and available seat', () {
    final ride = fakeRides[0];
    final result = RidesService.filterBy(
      departure: ride.departureLocation,
      seatRequested: 1,
    );
    expect(result.isNotEmpty, true);
    expect(result[0].departureLocation, ride.departureLocation);
  });
}
