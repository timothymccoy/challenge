# **Elixir API Code Challenge**

Implement a straightforward CRUD API based on the following objects:

## Firm
```
{
    "id": 132,
    "name": "Drake & Sweeny",
    "email": "info@ds.law",
    "location": {
        "street": "343 S Dearborn St",
        "city": "Chicago",
        "state": "IL",
        "zip": 60606,
    }
}
```

## Lawsuit
```
{
    "id": 2,
    "firmId": 132,
    "description": "Jeremy was hit by a driver running a redlight",
    "accidentDate": "2016-01-08",
    "plaintiff": {
        "firstName": "Jeremy",
        "lastName": "Johnson",
        "gender": "male",
        "dob": "1983-03-18"
        },
    "defendant": {
        "firstName": "Ronald",
        "lastName": "Ragero",
        "gender": "male",
        "dob": "1973-07-10"
        }
}
```

# Technical Requirements

Bonus points for:

- Testing!
- Deploying your solution to Heroku
- Documenting your solution with [slate docs](https://github.com/lord/slate), [apiary](https://apiary.io/), etc


