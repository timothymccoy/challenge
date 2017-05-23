# **CasePacer API Code Challenge**

Hello and welcome to the official **CasePacer Code Challenge**. We tend to be pretty practical here at CasePacer, so we'd like you to implement a straightforward CRUD API based on the following objects:

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

You can use whatever tech stack you'd like, bonus points for pushing the envelope and trying something new/out of your comfort zone (Elixir/Phoenix, etc). Other potential bonus points for:

- Testing!
- Deploying your solution (super easy to bootstrap with [Heroku](https://www.heroku.com/))
- Documenting your solution with [slate docs](https://github.com/lord/slate), [apiary](https://apiary.io/), etc

# Send it our way

- Submit a PR for your solution
- We can't wait to see it!

