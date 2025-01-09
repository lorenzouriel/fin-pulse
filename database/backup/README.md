### Create sql Dump
`docker exec container_id /usr/bin/mysqldump -u root_user --password=root_pass database > ./database/backup/data.sql`
`docker exec container_id /usr/bin/mysqldump -u root_user --password=root_pass database | Set-Content ./database/backup/data.sql`

### Public Key Retrieval Error
`jdbc:mysql://127.0.0.1:3306/database?allowPublicKeyRetrieval=true&useSSL=false`