import requests


def register_account(email: str, password: str):
    url = 'https://reqres.in/api/register'
    data = {
        'email': email,
        'password': password
    }
    headers = {'Content-type': 'application/json'}
    response = requests.post(url, json=data, headers=headers)
    json = response.json()
    return json['token']


def get_status_code():
    url = 'http://httpbin.org/status/200%2C418%2C505'

    response = requests.get(url)
    return response.status_code


def count_title_shorter_than(upper_bound: int):
    url = 'https://jsonplaceholder.typicode.com/posts'
    response = requests.get(url)
    json = response.json()
    filtered_json = [article for article in json if len(article['title']) < upper_bound]
    return len(filtered_json)


if __name__ == '__main__':
    """ calls all needed methods and prints their results """

    print('register_account: {} '.format(
        register_account(email='a@b.c', password='mypw')))
    # should return something like ”QpwL5tke4Pnpja7X”

    print('get_status_code: {}'.format(get_status_code()))
    # should return something like 200

    print('count_title_shorter_than: {}'.format(
        count_title_shorter_than(upper_bound=40)))
    # should return something like 53
