<?php
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="../css/style.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
    <div class="login-page">
  <div class="form">
    <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>Crear</button>
      <p class="message">Ya estas registrado? <a href="#">Iniciar Sesion</a></p>
    </form>
    <form action="../server/login.php" method="post" class="login-form">
      <input type="usuario" placeholder="username"/>
      <input type="pass" placeholder="password"/>
      <button>login</button>
      <p class="message">No estas registrado? <a href="#">Crea una cuenta</a></p>
    </form>
  </div>
</div>

</body>
</html>