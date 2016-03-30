$ ->
  $elem = $('[data-gmap]')
  lat = $elem.data('lat')
  long = $elem.data('long')

  render_map(lat, long, $elem)

render_map = (lat, long, $elem) ->
  lat_long =
    lat: lat
    lng: long
  map = new google.maps.Map $elem.get(0),
    center: lat_long
    zoom: 18
    mapTypeId: google.maps.MapTypeId.SATELLITE
  marker = new google.maps.Marker
    map: map
    position: lat_long
  map.setTilt(45)
