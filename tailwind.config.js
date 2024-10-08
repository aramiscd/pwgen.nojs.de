/** @type {import('tailwindcss').Config} */

module.exports =
    { content :
        [ "./app.js"
        ]
    , theme :
        { extend :
            {
            } 
        }
    , plugins :
        [ require('daisyui')
        ]
    , daisyui :
        { themes :
            [ "dark"
            , "light"
            ]
        }
    }
