void main() {
  // var list1 = [1, 2, 3];
  // var list2 = [0, ...list1];
  // print(list1);
  // print(list2);
  // print(list2.length);
  // var list = [1, 2, null];
  // print(list);
  // var list3 = [0, ...?list];
  // print(list3.length);


  // var nimDigits = [2, 3, 4, 1, 7, 2, 0, 2, 3, 5]; 
  // var nimList = [...nimDigits];
  // print(nimList);

  // bool promoActive = false;
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // var login = 'Staff';
  // var nav2 = [
  //   'Home',
  //   'Furniture',
  //   'Plants',
  //   if (login case 'Manager') 'Inventory',
  // ];
  // print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}