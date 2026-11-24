{% docs silver_airports %}
Airports are the central entity in the silver layer, keyed by `airport_ident`.
`silver_runways` and `silver_airport_comments` each refer to an airport by that
identifier. An airport can have multiple runways and comments, while some source
records may refer to an airport that is no longer present.
{% enddocs %}
