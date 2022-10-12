## DISPLAY THE ADDRESSES OF THE USERS ##
SELECT users.full_name, addresses.number, addresses.street, addresses.zip, addresses.city FROM users INNER JOIN addresses ON users.address_id = addresses.id;

## DISPLAY THE OWNER OF THE HORSES WITH THEIR STABLE ##
SELECT horses.name as "Horse Name", stables.name as "Stable Name", users.full_name as "Owner" FROM (((horses INNER JOIN stables ON stables.id = horses.stable_id) INNER JOIN horses_users ON horses.id = horses_users.horses_id) INNER JOIN users ON horses_users.users_email = users.email);

## DISPLAY THE EVENTS CONTAINED IN THE INVOICE OF "jean@gmail.com" ##
SELECT users.full_name as "Name", events.title as "Events in the invoice", events.start_date as "Date"  FROM (((users INNER JOIN invoices ON users.email=invoices.due_to_email) INNER JOIN invoices_events ON invoices_events.invoices_id=invoices.id)INNER JOIN `events` ON `events`.id=invoices_events.events_id) WHERE users.email="jean@gmail.com";

## DISPLAY ALL THE SUBSCRIBERS FOR A GIVEN EVENT (1) ##
SELECT users.full_name as "Subscriber Names" FROM ((events INNER JOIN events_subscribers ON events.id=events_subscribers.events_id) INNER JOIN users ON users.email=events_subscribers.users_email) WHERE events.id=1;