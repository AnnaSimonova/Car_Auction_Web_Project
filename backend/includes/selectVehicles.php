<?php
require_once("db_connection.php");
require_once("functions.php");

$result_set = [];
$query = "SELECT vehicle.id as 'id', make.name as 'make', model.name as 'model', vehicle.model_year as 'year', vehicle.odometer as 'odometer_miles', engine_volume.volume as 'Engine volume', vehicle.engine_type as 'Engine type', fuel_type.name as 'Fuel', drive_line_type.name as 'Drive line type', body_style.name as 'body_style', transmission.name as 'Transmission', auction.buy_now_price as 'buy_now',  auction.pre_bid_price as 'Current bid', auction.date_time as 'Auction date', currency.sign as 'Currency', vehicle_type.name as 'vehicle_type',vehicle.actual_cash_value as 'ACV', auction_type.name as 'Auction type', title.name as 'Document type', vehicle.vin as 'VIN', start_code.start_code as 'start_code', us_state.name as 'Location' FROM vehicle JOIN make ON vehicle.make_id=make.id JOIN model ON vehicle.model_id=model.id LEFT JOIN engine_volume ON vehicle.engine_volume_id=engine_volume.id JOIN fuel_type ON vehicle.fuel_id=fuel_type.id LEFT JOIN drive_line_type ON vehicle.drive_line_type_id=drive_line_type.id JOIN body_style ON vehicle.body_style_id=body_style.id JOIN transmission ON vehicle.transmission_id=transmission.id LEFT JOIN auction ON vehicle.id = auction.vehicle_id LEFT JOIN currency ON auction.currency_id=currency.id JOIN vehicle_type ON vehicle.vehicle_type_id = vehicle_type.id LEFT JOIN auction_type ON auction.auction_type_id = auction_type.id LEFT JOIN title ON vehicle.title_id = title.id LEFT JOIN start_code ON vehicle.start_code_id = start_code.id LEFT JOIN us_state ON vehicle.location_id = us_state.id;";
$query_result = mysqli_query($connection, $query);
confirm_query($query_result);
while($vehicle = mysqli_fetch_assoc($query_result)) {
    $result_set[] = $vehicle;
}

// $loss_query = "SELECT damage.name as 'loss' FROM vehicle LEFT JOIN damage ON vehicle.damage_id_loss = damage.id;";
// $loss_query_result = mysqli_query($connection, $loss_query);
// confirm_query($loss_query_result);
// while($vehicle = mysqli_fetch_assoc($loss_query_result)) {
//     $result_set[] = $vehicle;
// }

// $prdamage_query = "SELECT damage.name as 'primary_damage' FROM vehicle LEFT JOIN damage ON vehicle.damage_id_primary = damage.id;";
// $prdamage_query_result = mysqli_query($connection, $prdamage_query);
// confirm_query($prdamage_query_result);
// while($vehicle = mysqli_fetch_assoc($prdamage_query_result)) {
//     $result_set[] = $vehicle;
// }

// $secdamage_query = "SELECT damage.name as 'secondary_damage' FROM vehicle LEFT JOIN damage ON vehicle.damage_id_secondary = damage.id;";
// $secdamage_query_result = mysqli_query($connection, $secdamage_query);
// confirm_query($secdamage_query_result);
// while($vehicle = mysqli_fetch_assoc($secdamage_query_result)) {
//     $result_set[] = $vehicle;
// }
print_r(json_encode($result_set));

?>