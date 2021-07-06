<?php
# 1. Definisco le costanti per la connessione
define('DB_SERVERNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_NAME', 'uni');
define('DB_PORT', '3306');

# 2. Stabiliamo la connessione con il database
$connection = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_PORT);

# 3. Verifico la connessione
if ($connection && $connection->connect_error) {
    echo "Connection failed: " . $connection->connect_error;
    die();
}
echo 'Connection Successful';

# 4. seleziono una quary di tutti i corsi di laurea
$sql = "SELECT `name` FROM `degrees`";

$results = $connection->query($sql);
//var_dump($results);     ------> 75row

# 5. controllo se in risultato nn sia pari a zero ed eseguo un ciclo in caso contrario
if ($results && $results->num_rows > 0) {
    while ($corso_di_laurea = $results->fetch_array()) {
?>
        <h3><?= $corso_di_laurea['name']; ?></h3>
<?php
    }
} else if ($results) {
    echo 'Nessun Risultato';
} else {
    echo 'Errore nella query';
}

# 6. Chiudiamo la connessione
$connection->close();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connessione al DB</title>
</head>

<body>
</body>

</html>