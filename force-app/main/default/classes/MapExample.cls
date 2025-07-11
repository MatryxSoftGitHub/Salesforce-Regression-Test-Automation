public class MapExample {
    
    public static void mapExample(){
        Map<Integer, String> basket = new Map<Integer, String>();
        basket.put(1,'Red');
        basket.put(2,'Green');
        basket.put(3,'Blue');
        basket.put(4,'Orange');
        System.debug('This is the key value pairs '  + basket);
        basket.put(2,'Black');
        System.debug('This is the key value pairs '  + basket);
        
        
        Map<Integer, String> basket2 = new Map<Integer, String>();
        basket2.put(5,'Brown');
        basket2.put(6,'Yellow');
        basket2.put(7,'White');
        basket2.put(8,'Marun');
        
        basket.putAll(basket2);
        System.debug('This is the key value pairs '  + basket);
        basket.remove(4);
        System.debug('This is the key value pairs '  + basket);
        
                System.debug('This is displaying only values of Map '  + basket.values());

                        System.debug('This is displaying wheather it contains key '  + basket.containsKey(5));
                                System.debug('This is displaying wheather it contains key '  + basket.containsKey(50));


        
    }
}