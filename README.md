whadru-rest
===========

Simple REST API for use by auditions that need to consume data from Whad-R-U-Looking'-At "app"

Requirements
------------

* Sinatra (http://www.sinatrarb.com)
* Sinatra::JSON (http://www.sinatrarb.com/contrib/json.html)
* Nokogiri (http://nokogiri.org)

Available Endpoints
-------------------

* / - top-level URI to ensure the API is running. Returns static text string akin to "Hello World"

* /sites - returns a JSON-formatted list of all sites, including:
  * the site "key" - identifier for the site, with no spaces *(e.g. NASAEarthdata or Element84)*
  * the site information:
    * site name - human-readable site name *(e.g. 'NASA Earthdata' or 'Element 84')*
    * site URL - the full URL of the site *(e.g. 'https://earthdata.nasa.gov' or 'http://www.element84.com')*
    
* /sites/[site\_key] - returns an informational message identifying the site identified by *site\_key*

* /sites/[site\_key]/name - returns the human-readable name of the site identified by *site\_key*

* /sites/[site\_key]/url - returns the full URL of the site identified by *site\_key*

* /sites/[site\_key]/visitors - returns a list of all visitors to the site identified by *site\_key* with:
  * for each visit, the IP address of the visitor (IPv4 format, e.g. 128.218.54.23)
  * for that IP address, the number of visits to the site (regardless of URL)
  
* /sites/[site\_key]/urls - returns an array of URLs off the site identified by *site\_key* that are being tracked. Each URL entry includes:
  * the URL of the link element (e.g. http://www.element84.com/portfolio)
  * the name of the link in the <a> element (e.g. "Portfolio")
    
* /sites/[site\_key]/visits - returns an array of URLs and visit counts for the site identified by *site\_key*. Each entry includes:
  * the URL to which the visits occurred (e.g. http://www.element84.com/portfolio)
  * the number of visits to that URL