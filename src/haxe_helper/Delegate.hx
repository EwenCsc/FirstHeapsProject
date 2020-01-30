package haxe_helper;

/**
 * To overload operators you need to do an abstract class
 * And the "=" operator can't be overloaded
 * 
 * For op overloading doc :
 * ? http://haxedev.wikidot.com/article:operator-overloading
 * ? http://haxedev.wikidot.com/article:operator-overloading-cheatsheet
 */
abstract Delegate(List<Void -> Void>) {
    
    public function new(?_callbacks : List<Void -> Void>, ?_callback : Void -> Void) {
        this = new List<Void -> Void>();
        if (_callbacks != null){
            this = _callbacks;
        }
        else  if (_callback != null) {
            this.add(_callback);
        }
    }

    @:op(A += B)
    public inline function addassign(rhs:Void -> Void) : Delegate {
        this.add(rhs);
        return new Delegate(this);
    }

    public function invoke() {
        if (this.length > 0) {
            for (callback in this) {
                callback();
            }
        }
    } 

    public function clear() {
        this.clear();
    }

    public function invokeOnce() {
        invoke();
        clear();
    }
}