package haxe_helper;

import hl.Profile.Result;

// abstract Delegate<T>(Array<Dynamic>) {
class Delegate/*<T>*/ {
    
    private var callbacks : List<Array<Dynamic> -> Void>;
    
    public function new(?_callbacks : List<Array<Dynamic> -> Void>) {
        if (_callbacks != null)
            callbacks = _callbacks;
        else 
            callbacks = new List<Array<Dynamic> -> Void>();
    }

    @:op(A += B)
    public function addassign(lhs:List<Array<Dynamic> -> Void>, rhs:Array<Dynamic> -> Void) : List<Array<Dynamic> -> Void> {
        lhs.add(rhs);
        return lhs;
    }
    
    @:op(A = B)
    public function assign(lhs:List<Array<Dynamic> -> Void>, ?rhs : Array<Dynamic> -> Void) : List<Array<Dynamic> -> Void> {
        var result = new List<Array<Dynamic> -> Void>();
        if (rhs != null) {
            result.add(rhs);
        }
        return result;
    }

    public function invoke(?param:Array<Dynamic>) {
        if (callbacks.length > 0) {
            for (callback in callbacks) {
                callback(param);
            }
        }
    } 
}