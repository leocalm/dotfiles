import requests

API_KEY = 'c441d913315c4f114e08ac13334c51a7'

LOCATION_URL = 'http://ip-api.com/json'
BASE_URL = 'http://api.openweathermap.org/data/2.5/weather?{}'
PARAMS = 'lat={}&lon={}&APPID={}&units=metric'

ICONS = {
    500: '🌦',
    501: '🌦',
    520: '🌦',
    521: '🌦',
    800: '☀️',
    801: '🌤',
    803: '⛅️',
    804: '☁️'
}


def get_location():
    location_result = requests.get(LOCATION_URL).json()
    city = location_result.get('city')
    lat = location_result.get('lat')
    lon = location_result.get('lon')
    return city, lat, lon


def get_weather(lat, lon):
    url = BASE_URL.format(PARAMS.format(lat, lon, API_KEY))
    weather_result = requests.get(url).json()

    category = weather_result['weather'][0]['id']
    temp = weather_result['main']['temp']
    wind_speed = weather_result['wind']['speed']
    return category, temp, wind_speed


if __name__ == '__main__':
    city, lat, lon = get_location()
    category, temp, wind_speed = get_weather(lat, lon)

    icon = ICONS.get(category, category)

    # print('{city}: {icon} {temp}°C, {wind_speed} m/s'
    #       .format(city=city,
    #               icon=icon,
    #               temp=temp,
    #               wind_speed=wind_speed))

    print('{temp}°C {icon}'
          .format(icon=icon,
                  temp=temp))
