# exploreapollo.org-schema
Database management for exploreapollo.org

## Database 

All migrations should be run against Postgres 9.4

## Domains

### `reasonable_string`

Text with the constraint: 0 < length <= 254

[254 is the maximum length of an email address.][email_max]

## Tables

### `users`

All fields in this table have a minimum length of 1 and a max length of 254 characters.

field | domain
--- | --- | ---
name | `reasonable_string`
email | `reasonable_string`
password | [TEXT][]

[email_max]: http://www.rfc-editor.org/errata_search.php?rfc=3696&eid=1690
[TEXT]: http://www.postgresql.org/docs/9.4/static/datatype-character.html
