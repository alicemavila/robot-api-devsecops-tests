from faker import Faker

faker = Faker()


def create_user_payload():
    return {
        "name": faker.name(),
        "job": faker.job()
    }


def update_user_payload():
    return {
        "name": faker.name(),
        "job": "Senior QA Engineer"
    }