<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body ng-app="myapp" ng-controller="logout">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>                        
          </button>
          <a class="navbar-brand" href="#">Indian Rail</a>
        </div>


        <div class="collapse navbar-collapse" id="myNavbar">
         
          <ul class="nav navbar-nav navbar-right">

            <li><a href="adduser.php">Add User</a></li>
            <li><a href="lost.php">Lost Package</a></li>
            <li><a href="updatepackage.php">InTransit Package</a></li>
            <li><a href="trainweight.php">Estimate Load</a></li>
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#">
              <span class="glyphicon glyphicon-user"></span>
               <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="../model/logout.php" ng-model="log"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
              </ul>
            </li>
          </ul>
        </div>
      
      </div>
    </nav>
    <script type="text/javascript">
      

    </script>
    
    </body>
</html>



