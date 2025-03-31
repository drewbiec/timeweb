import pytest
import re
from app import app

@pytest.fixture
def client():
    with app.test_client() as app_client:
        yield app_client

def test_time(client):
    response = client.get('/')
    assert response.status_code == 200

    response_text = response.data.decode("utf-8")

    pattern = r"^[A-Za-z]{3} \d{1,2}, \d{4}, \d{2}:\d{2}$"

    assert re.match(pattern, response_text), f"Response '{response_text}' does not match"
