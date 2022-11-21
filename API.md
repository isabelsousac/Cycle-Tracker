# Create new user
Request:
``` 
POST /user
{
    "first_name": <string>,
    "last_name": <string>,
    "email": <string>,
    "password": <string>
}
```

Response:
``` 
201 CREATED
```

# Edit user
Request: 
``` 
POST /user/edit
Authorization: Bearer <token>

{
    "first_name": <string>,
    "last_name": <string>,
    "take_pill": <boolean>,
    "notification_on": <boolean>
}
```

Response:
``` 
200 OK
```

# Create new cycle
Request: 
``` 
POST /cycle
Authorization: Bearer <token>

{
    "last_period_date": <date>,
    "cycle_average_time": <integer>,
    "take_pill": <boolean>,
    "notification_on": <boolean>
}
```

Response:
``` 
201 CREATED
```

# Show cycle

``` 
GET /cycle/<id>
Authorization: Bearer <token>
```

Response:
```
200 OK
{
    "cycle_start": <date>,
    "cycle_end": <date>,
    "period_start": <date>,
    "period_end": <date>,
    "symptoms": [
        {
        "date": <date>,
        "symptom": <string>,
        "level": <integer>
        }
    ]
}
```

# Edit period
Request: 
``` 
POST /cycle/<id>/period/edit
Authorization: Bearer <token>

{
    "period_start": <date>|null,
    "period_end": <date>|null,
    "period_flow": <string>|null
}
```

Response:
``` 
200 OK
```

# Show period 

``` 
GET /cycle/<id>/period
Authorization: Bearer <token>
```

Response:
```
200 OK
{
    "period_start": <date>,
    "period_end": <date>,
    "period_flow": <string>,
    "symptoms": [
        {
        "date": <date>,
        "symptom": <string>,
        "level": <integer>
        }
    ]
}
```

# Create new symptom
Request: 
``` 
POST /cycle/<id>/symptoms
Authorization: Bearer <token>

{
    "date": <date>,
    "symptom": <string>,
    "level": <integer>,
}
```

Response:
``` 
201 CREATED
```

# Show symptoms (within specific cycle)

``` 
GET /cycle/<id>/symptoms
Authorization: Bearer <token>
```

Response:
```
200 OK
{
    "symptoms": [
        {
        "date": <date>,
        "symptom": <string>,
        "level": <integer>
        }
    ]
}
```