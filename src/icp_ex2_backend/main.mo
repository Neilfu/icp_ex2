import Array "mo:base/Array";
import Int "mo:base/Int";
import Nat "mo:base/Nat";

actor {

  func sort(arr:[var Int], low:Nat, high:Nat){
    if (low > high) return;
    var arrow_0 = arr[low];
    var left = low;
    var right = high;
    while(left < right){
      while (arr[right] > arrow_0 and right > left){
        right -= 1;
      };
      if (left < right ){
        arr[left] := arr[right];
        left += 1;
      };
      
      while (arr[left] < arrow_0 and left < right){
        left += 1;
      };
      if (left < right){
        arr[right] := arr[left];
        right -= 1;
      };
      arr[left] := arrow_0;
      var i = 0;
      if (left >= 1) sort(arr, low, left-1);
      sort(arr, left+1, high);
      
    };
  };

  public func qsort(arr:[Int]): async [Int]{
    var newArr:[var Int] = Array.thaw(arr);
    sort(newArr, 0, newArr.size()-1);
    Array.freeze(newArr);
  }
};
