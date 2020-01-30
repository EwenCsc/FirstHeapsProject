package haxe_helper;

class Delegate {
    
    // private var callbacks : List<Array<Dynamic> -> Void>;
    public var callbacks : List<Void -> Void>;
    
    public function new(?_callbacks : List<Void -> Void>) {
        if (_callbacks != null){
            callbacks = _callbacks;
        }
        else{
            callbacks = new List<Void -> Void>();
        }
    }
    
    @:op(A = B)
    public function assign(lhs:Delegate, ?rhs : Void -> Void) : Delegate {
        lhs.callbacks = new List<Void -> Void>();
        if (rhs != null) {
            lhs.callbacks.add(rhs);
        }
        return lhs;
    }

    @:op(A + B)
    public function add(lhs:Delegate, rhs:Void -> Void) : Delegate {
        lhs.callbacks.add(rhs);
        return lhs;
    }

    @:op(A += B)
    public inline function addassign(/*lhs:Delegate,*/ rhs:() -> Void) /*: Delegate*/ {
        // lhs.callbacks.add(rhs);
        callbacks.add(rhs);
        // return lhs;
        // return new Delegate(callbacks);
    }
    
    // public function addassign2(rhs:Void -> Void){
    //     callbacks.add(rhs);
    // }

    public function invoke() {
        if (callbacks.length > 0) {
            for (callback in callbacks) {
                callback();
            }
        }
    } 
}