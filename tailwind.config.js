/** @type {import('tailwindcss').Config} */

module.exports =
    { content :
        [ "./www/app.js"
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
