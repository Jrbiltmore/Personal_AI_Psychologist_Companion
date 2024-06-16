
import requests
import os

def fetch_datasets(query):
    api_key = "YOUR_BING_API_KEY"
    headers = {"Ocp-Apim-Subscription-Key": api_key}
    params = {"q": query, "count": 10}

    response = requests.get("https://api.bing.microsoft.com/v7.0/search", headers=headers, params=params)
    response.raise_for_status()
    results = response.json().get("webPages", {}).get("value", [])

    if not os.path.exists("datasets"):
        os.makedirs("datasets")

    for result in results:
        url = result["url"]
        response = requests.get(url)
        filename = os.path.join("datasets", os.path.basename(url))
        with open(filename, "wb") as file:
            file.write(response.content)

fetch_datasets("open datasets for AI training")
