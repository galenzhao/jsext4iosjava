package test;

import org.galenzhao.jsext.GZjsExt;

import javax.script.ScriptException;

/**
 * Created by galenzhao on 2018/4/15.
 */
public class demo {

    public static void main(String[] args) throws ScriptException, NoSuchMethodException {
                String js = "//var console = {};\n" +
                "\n" +
                "//var ResultModel = {\n" +
                "//    \"code\": -1,\n" +
                "//    \"result\": null\n" +
                "//};\n" +
                "\n" +
                "var sumofmonery = function (passengers) {\n" +
                "    console.log(passengers);\n" +
                "    var p = JSON.parse(passengers).values;\n" +
                "    var total = 0;\n" +
                "    for (index = 0; index < p.length; ++index) {\n" +
                "        //console.log(Object.keys(p[index]));\n" +
                "        total += p[index].price;\n" +
                "    }\n" +
                "    return total;\n" +
                "};\n";

        String json = "{\"values\":[{\"name\":\"name1\",\"price\":100},{\"name\":\"n2\",\"price\":50}],\"code\":11}";

        GZjsExt jsExt = new GZjsExt(js);
        Object result = jsExt.call("sumofmonery", json);

        System.out.println("args = [" + result + "]");
    }
}
