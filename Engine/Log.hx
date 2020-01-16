package engine;
import h2d.Object;
import  haxe.Constraints;

class Log extends h2d.Drawable{

    static var messages = new Map<String, h2d.Text>(); 

    public static function addLog(_text:String, _color:Int, _key:String, _parent:h2d.Object) {
        if(messages.exists(_key)){
            messages[_key].text = _text;
            messages[_key].textColor = _color;
        }
        else {
            var text = new h2d.Text(hxd.res.DefaultFont.get(), _parent);
            text.text = _text;
            text.textColor = _color;
            messages.set(_key, text);       
        }
    }
}