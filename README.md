# ethereum-smart-contract-oracle-nba

This is a mock smart contract/oracle meant to be run in testrpc to demonstrate a more complex smart contract as oracle.  In other words, an oracle that is hosts on the blockchain.

The concept is this: owner adds NBA scores when they come in. This costs a little gas. Any other user can query this contract for a valid score.  Eventually, I plan to add the ability to require a small payment for each query. It may only ever be feasible on the testrpc, based on ETH prices. It could be an exercise in usefulness. I might find that some of these concepts are stupid, too expensive, burdensome or not useful in some other way. I just want to know, and I can't until I've done it.

To save a score, json will be sent, like this:

```
    {
        ‘homeTeam’: ‘LAC’,
        ‘awayTeam’: ‘LAL’,
        ‘homeScore`: ‘109’,
        ‘awayScore`: ’104’,
        ‘date’: ‘YYYY-MM-DD’,
        `wonBy’: `LAC`
    }
```

This json object will be .toLowerCase(), then the teams and dates will be hashed and saved as in a mapping
 hash => json

```
    Format for hash key
    {
        ‘Home’: ‘LAC’,
        ‘Visit’: ‘LAL’,
        ‘Date’: ‘YYYY-MM-DD’
    }
```

Initially, only the owner can save it. Eventually, there might be a 3+ multisig system where there need to be three or more (odd) signers, and there must be a majority to show up in a query.

```
    Format to query record:
    {
        ‘Home’: ‘LAC’,
        ‘Visit’: ‘LAL’,
        ‘Date’: ‘YYYY-MM-DD’
    }
```

The object will be .toLowerCase() and then hashed, and looked up in the mapping.

When queried, the record will be returned like this (query before .toLowerCase()):

```
    {
        'query': {
            ‘home’: ‘LAC’,
            ‘away’: ‘LAL’,
            ‘date’: ‘YYYY-MM-DD’
        },
        'result': {
            ‘homeTeam’: ‘LAC’,
            ‘awayTeam’: ‘LAL’,
            ‘homeScore': ‘109’,
            ‘awayScore': ’104’,
            ‘date’: ‘YYYY-MM-DD’,
            'won’: `LAC`
        }
    }
```


Eventually move data out of contract to a separate storage contract.
That contract can only be queried by this contract.
Contract will allow owner to update address of contract that is pointed at (maybe one address can store one year's scores, etc)

