
mixin Check {
  bool authenticate(String username, String password) {
    if (username == 'admin' && password == 'password') {
      return true;
    }
    return false;
  }
}


mixin Authorize {
  bool isAuthorized(String role, String resource) {
    
    if (role == 'admin' && resource == 'admin_panel') {
      return true;
    }
    return false;
  }
}

// User class
class User with Check, Authorize {
  String username;
  String password;
  String role;

  User(this.username, this.password, this.role);

  bool login() {
    if (authenticate(username, password)) {
      print('Login successful');
      return true;
    } else {
      print('Login failed');
      return false;
    }
  }

  bool checkRes(String resource) {
    if (isAuthorized(role, resource)) {
      print('Access granted to $resource');
      return true;
    } else {
      print('Access denied to $resource');
      return false;
    }
  }
}

void main() {
  User admin = User('admin', 'password', 'admin');
  User user = User('user', 'password', 'user');

  admin.login(); // Login successful
  admin.checkRes('admin_panel');

  user.login(); 
  user.checkRes('admin_panel'); 
}