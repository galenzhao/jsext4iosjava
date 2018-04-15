//var console = {};

//var ResultModel = {
//    "code": -1,
//    "result": null
//};

var sumofmonery = function (passengers) {
    console.log(passengers);
    var p = JSON.parse(passengers).values;
    var total = 0;
    for (index = 0; index < p.length; ++index) {
        //console.log(Object.keys(p[index]));
        total += p[index].price;
    }
    return total;
};
