public class Calculation {
    
   public static void add(){
       Integer num1 = 3, num2 = 8;
   Integer sum = num1 + num2;
       System.debug('Sum = '+ sum);
   } 
     public static void sub(){
           Integer num1 = 3, num2 = 8;
   Integer sub = num1 - num2;
         System.debug('Sub = '+ sub);
   } 
     public static void product( Integer num1, Integer num2){
   Integer product = num1 * num2;
           System.debug('Product = '+ product);
   } 
     public static void div(Integer num1, Integer num2){
   Integer div = num1 / num2;
          System.debug('Div = '+ div);
   } 
}