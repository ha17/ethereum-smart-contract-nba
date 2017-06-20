pragma solidity ^0.4.4;

/*
    Owner can add
    Anynoe can query
    Version that it costs you the tiniest amount to query it

    Format to save record:
    {
        ‘homeTeam’: ‘LAC’,
        ‘awayTeam’: ‘LAL’,
        ‘homeScore`: ‘109’,
        ‘awayScore`: ’104’,
        ‘date’: ‘YYYY-MM-DD’,
        `wonBy’: `LAC`
    }

    Format to query record:
    {
        ‘Home’: ‘LAC’,
        ‘Visit’: ‘LAL’,
        ‘Date’: ‘YYYY-MM-DD’
    }

    @return json
    {
        'query': {
            ‘home’: ‘LAC’,
            ‘away’: ‘LAL’,
            ‘date’: ‘YYYY-MM-DD’
        },
        'result': {
            ‘home’: ‘LAC’, // home team
            ‘away’: ‘LAL’, // away team
            ‘homescore': ‘109’, // home score
            ‘as': ’104’, // away score
            ‘d’: ‘YYYY-MM-DD’,
            'w’: `LAC` // winner
        }
    }
*/

contract NBAScores {
    struct Teams {
        string abbr
    }

    struct Results {
        string homeTeam,
        string awayTeam,
        string homeScore,
        string awayScore,
        string date, // better data type? probably just a uint
        string wonBy
    }

    function NBAScores()
    {
        address ownerWhoCanUpdate = msg.sender;
    }

    // test for each validation
    // maybe extract it to a library
    // validation should not cost gas; no state change
    function addResult(json)
    {
        // if ownerWhoCanUpdate == msg.sender
        // eventually make it available to others for multsig
        // validate team name for home/away
        // validate the score is a number
        // validate the scores are not a tie
        // validate the date is valid
        // validate the date is not in the future
    }

    // tests
    // - bad format
    // - unknown team
    // - bad date (make a library that can be called, or another contract "validDate')
    // - date in future (make a library that can be called, or another contract "validDate')
    function query(json)
    {
        // str to lower strings
        // make object
        // validate format, return error + example if bad
        // hash object
        // query contract
        // return false on unknown, such as team not found, date, game not found
        // return result on match
    }
}
