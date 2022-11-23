# Create new user (sign up)
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
{
    "user": {
        "first_name": <string>,
        "last_name": <string>,
        others user info here (i'm tired haha)
    },
    "token": <string>
}
```

# Set up cycle and user (after sign up)
Request:
```
POST /setup
Authorization: Bearer <token>
{
    "take_pill": <boolean>,
    "notification_on": <boolean>,
    "period_end": <date>,
    "average_period_days": <integer>
}
```

Response:
```
201 CREATED
{
    "period_start": <date>
    "period_end": <date>
    "cycle_id": <integer>
}
```

# Login user (sign in)
Request:
``` 
POST /user
{
    "email": <string>,
    "password": <string>
}
```

Response:
``` 
200 OK
{
    "user": {
        "first_name": <string>
        "last_name": <string>
        others user info here (i'm tired haha)
    },
    "token": <string>
}
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
    "period_end": <string>,
    "average_period_days": <integer>,
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

# Edit period -- (maybe I'll keep that response, maybe not)
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
{
    "period_start": <date>|null,
    "period_end": <date>|null,
    "period_flow": <string>|null
}
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
{
    "date": <date>,
    "symptom": <string>,
    "level": <integer>
}
```

# Show symptoms (within specific cycle) -- i'll keep it if we want to show all symptoms that happened in one month
Request:
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

# Edit symptom
Request:
```
PUT /symptoms/<id>
Authorization: Bearer <token>
```


Response:
```
200 OK
{
    "date": <date>,
    "symptom": <string>,
    "level": <integer>
}
```

# Delete symptom (from one day)
Request:
```
DELETE /symptoms/<id>
Authorization: Bearer <token>
```

Response:
```
200 OK
```