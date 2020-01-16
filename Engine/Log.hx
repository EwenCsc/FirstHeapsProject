package engine;
import h2d.Object;
import  haxe.Constraints;

class Log extends h2d.Drawable{

    var messages = new Map<String, h2d.Text>(); 

    public static function addLog(_text:String, _color:Int, _key:String, _parent:h2d.Object) {
        // var msg = new Msg(_text, _color);
        // displayMsg(msg, _parent);

        // if(messages.exist)
        var text = new h2d.Text(hxd.res.DefaultFont.get(), _parent);
        text.text = _text;
        text.textColor = _color;
    }

    // static function displayMsg(_msg:Msg, _parent:h2d.Object) {
    //     var text = new h2d.Text(hxd.res.DefaultFont.get(), _parent);
    //     text.text = _msg.text;
    //     text.textColor = _msg.color;
    // }
}

// class Msg {
//     public var text : String;
//     public var color : Int;
//     public function new(_text:String, _color:Int) {
//         text = _text;
//         color = _color;
//     }
// }