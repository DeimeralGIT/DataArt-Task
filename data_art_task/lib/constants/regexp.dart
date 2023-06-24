RegExp get emailRegexp => RegExp(
      r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.)+[a-zA-Z]{2,}$',
    );

RegExp get uppercaseRegexp => RegExp(r'[A-Z]');

RegExp get numberRegexp => RegExp(r'\d');
