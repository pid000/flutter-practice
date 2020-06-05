import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'C4EF7AA7-7017-4D04-8C1B-8E3D60717CA1';
const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData() async {
    String url = '$coinApiURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      var lastPrice = decodeData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the target request';
    }
  }
}
