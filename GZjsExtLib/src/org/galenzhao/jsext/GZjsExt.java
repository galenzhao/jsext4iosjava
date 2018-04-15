package org.galenzhao.jsext; /**
 * Created by galenzhao on 2018/4/15.
 */
import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class GZjsExt {

    private ScriptEngineManager manager = null;
    private ScriptEngine engine = null;

    public GZjsExt(String script) throws ScriptException {
        manager = new ScriptEngineManager();
        engine = manager.getEngineByName("JavaScript");
        if (!(engine instanceof Invocable)) {
            //System.out.println("Invoking methods is not supported.");
            //return;
            throw new ScriptException("Invoking methods is not supported.", "GZjsExt.java", 20);
        }

        GZjsConsole console = new GZjsConsole();
        engine.put("console", console);

        engine.eval(script);
    }

    public Object call(String function, String json) throws ScriptException, NoSuchMethodException {

        Invocable inv = (Invocable) engine;
        Object result = inv.invokeFunction(function, json);

        return result;
    }
}
