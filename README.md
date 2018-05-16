ProfitTrailer for Docker
------------------------

**ProfitTrailer** is a smart crypto currency trading bot. It gives you the ability to trade using different exchanges in a fast and simple way.
For easier deployment, I set up a *Docker Container*.

For more information about ProfitTrailer :

 - Official website : https://profittrailer.com
 - Wiki : https://wiki.profittrailer.io
 - Github : https://github.com/taniman/profit-trailer

Usage
-----

Start a new container with a volume for your config files

    docker run --name profittrailer -d -v "$( pwd )/mybot:/app/ProfitTrailer" gdomod/profit-trailer

If u want to update Profittrailer , just delete Profittrailer in mounted path and docker restart profittrailer

[![Docker Stars](https://img.shields.io/docker/stars/gdomod/profit-trailer.svg)](https://hub.docker.com/r/gdomod/profit-trailer/)
[![Docker Pulls](https://img.shields.io/docker/pulls/gdomod/profit-trailer.svg)](https://hub.docker.com/r/gdomod/profit-trailer/)

Credit
------

Based on the work of Beemster, go check it out here
https://github.com/beemster/profittrailer
