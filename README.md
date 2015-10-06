# exploreapollo.org-schema
Database management for exploreapollo.org

## Domains

### `reasonable_string`

Text with the constraint: 0 < length <= 254

[254 is the maximum length of an email address.][email_max]

## Tables

### `users`

All fields in this table have a minimum length of 1 and a max length of 254 characters.

field | domain | constraints
--- | --- | ---
name | `reasonable_string` | 0 < length <= 254
email | `reasonable_string` | 0 < length <= 254
password | TEXT

[email_max]: http://www.rfc-editor.org/errata_search.php?rfc=3696&eid=1690
