void miniMaxSum(List<int> arr){
  if(arr.length == 5){
    int sum = 0;
    int max = arr[0];
    int min = arr[0];

    arr.forEach((element) {
      sum+= element;

      if(max < element){
        max = element;
      }else{
        if(min > element){
          min = element;
        }
      }
    });
    print("${sum - max} ${sum - min}");
  }
  else{
    print("0 0");
  }

}
void main() {
  List<int> arr = [12,5,8,3,10];
  miniMaxSum(arr);
}