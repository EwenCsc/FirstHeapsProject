package haxe_helper;

// abstract Delegate<T>(Array<Dynamic>) {
class Delegate<T> {
    
    private var callbacks : List<Array<Dynamic> -> T>;
    
    public function new(?_callbacks : List<Array<Dynamic> -> T>) {
        if (_callbacks != null)
            callbacks = _callbacks;
        else 
            callbacks = new List<Array<Dynamic> -> T>();
    }
}