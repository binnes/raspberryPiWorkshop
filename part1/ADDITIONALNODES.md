*Quick links :*
[Home](/README.md) - [**Part 1**](/part1/README.md) - [Part 2](/part2/README.md) - [Part 3](/part3/README.md) - [Part 4](/part4/README.md)
***
**Part 1** - [Setup](/part1/PREREQ.md) - [First Flow](/part1/FIRSTFLOW.md) - [Install Nodes](/part1/INSTALLNODE.md) - [Node-RED Context](/part1/CONTEXT.md) - [Sensors](/part1/SENSORS.md) - [SenseHAT](/part1/SENSEHAT.md) - [**Additional Nodes**](/part1/ADDITIONALNODES.md) - [Cloud](/part1/IOTCLOUD.md)
***

# Additiional Nodes

## JSONata

### Example 1
```
{
    "payload": [
        {
            "FirstName": "Fred",
            "Surname": "Smith",
            "Age": 28,
            "Address": {
                "Street": "Hursley Park",
                "City": "Winchester",
                "Postcode": "SO21 2JN"
            },
            "Phone": [
                {
                    "type": "home",
                    "number": "+44 203 5441234"
                },
                {
                    "type": "office",
                    "number": "00 44 1962 001234"
                },
                {
                    "type": "mobile",
                    "number": "0044 7777-001234"
                }
            ]
        },
        {
            "FirstName": "Freda",
            "Surname": "Smith",
            "Age": 25,
            "Address": {
                "Street": "Hursley Park",
                "City": "Winchester",
                "Postcode": "SO21 2JN"
            },
            "Phone": [
                {
                    "type": "home",
                    "number": "+44 203 9871234"
                },
                {
                    "type": "office",
                    "number": "00 44 1962 998765"
                },
                {
                    "type": "mobile",
                    "number": "0044 7777-098765"
                }
            ]
        }
    ]
}
```

JSONata expressions:

- `{"Name" : payload.FirstName & ' ' & payload.Surname}`
- `payload.{"Name" : FirstName & ' ' & Surname}`
- `payload.{"Name" : FirstName & ' ' & Surname, "Phone" : Phone{type : number}}`
- `payload.{FirstName & ' ' & Surname : Phone{type : number}}`
- `payload.{FirstName & ' ' & Surname : Phone{type : $replace(number, /^(\+|00)\s*(\d*)[\s-]+(\d*)[\s-]+(\d*)$/,'+$2 $3-$4')}}`

### Example 2

HTTP request to https://api.npmjs.org/downloads/range/last-week/node-red and return as JSON parsed object

Switch statement compare property msg.payload.downloads[6].downloads for greater or equal to JSONata expression :

- `payload.downloads.downloads`
- `$average(payload.downloads.downloads)`

Add second otherwise clause for when average is less than average.

***
*Quick links :*
[Home](/README.md) - [**Part 1**](/part1/README.md) - [Part 2](/part2/README.md) - [Part 3](/part3/README.md) - [Part 4](/part4/README.md)
