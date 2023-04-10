import 'network.dart';

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
  Future<dynamic> getCoinData(String coin) async {
    NetworkHelper network = NetworkHelper('$URL/BTC/$coin?apikey=$apiKey');

    var coinData = await network.getData();

    print(coinData);
    return coinData;
  }
}
