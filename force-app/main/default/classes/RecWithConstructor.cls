public class RecWithConstructor {
    Decimal Length , Breadth;
    public RecWithConstructor(Decimal l, Decimal b){
        Length = l;
        Breadth = b;
        }
    public void area(){
        Decimal a = length*breadth;
            System.debug('Area of rectangle = '+a);
    }
}