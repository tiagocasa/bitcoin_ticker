import 'dart:convert';

import 'network.dart';
import 'package:http/http.dart' as http;

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

const apiKey = '986DE50A-0A22-470D-ACD0-32C48AF956A9';
const URL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String coin) async {
    // Map com USD e Rate como string
    Map<String, String> prices = {};
    for (String crypto in cryptoList) {
      http.Response response =
          await http.get(Uri.parse('$URL/$crypto/$coin?apikey=$apiKey'));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        prices[crypto] = decodedData['rate'].toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return prices;
  }
}
