whadru-rest
===========

Simple REST API for use by auditions that need to consume data from Whad-R-U-Looking'-At "app"

Requirements
------------

* Sinatra (http://www.sinatrarb.com)
* Sinatra::JSON (http://www.sinatrarb.com/contrib/json.html)

Available Endpoints
-------------------

* / - top-level URI to ensure the API is running. Returns static text string akin to "Hello World"
* /sites - returns a JSON-formatted list of all sites, including:
  * the site "key" - identifier for the site, with no spaces
  * the site information:
    * site name - human-readable site name
    * site URL - the full URL of the site