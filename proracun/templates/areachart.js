{% if init %}
var labelType, useGradients, nativeTextSupport, animate, labelpos = {}, labelposR = {};

(function() {
  var ua = navigator.userAgent,
      iStuff = ua.match(/iPhone/i) || ua.match(/iPad/i),
      typeOfCanvas = typeof HTMLCanvasElement,
      nativeCanvasSupport = (typeOfCanvas == 'object' || typeOfCanvas == 'function'),
      textSupport = nativeCanvasSupport 
        && (typeof document.createElement('canvas').getContext('2d').fillText == 'function');
  //I'm setting this based on the fact that ExCanvas provides text support for IE
  //and that as of today iPhone/iPad current text support is lame
  labelType = (!nativeCanvasSupport || (textSupport && !iStuff))? 'Native' : 'HTML';
  nativeTextSupport = labelType == 'Native';
  useGradients = nativeCanvasSupport;
  useGradients = false;
  animate = !(iStuff || !nativeCanvasSupport);
})();

function add_subchart(postavka, onComplete) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
{% if language == 'en' %}
    script.src = '{% url proracun_areachart_js po language 123456789 inflacija %}'.replace('123456789', postavka);
{% else %}
    script.src = '{% url proracun_areachart_js po 123456789 inflacija %}'.replace('123456789', postavka);
{% endif %}
    $(document.body).append(script);
    onComplete && onComplete();
}

function format_money(n, c, d, t) {
    var c = isNaN(c = Math.abs(c)) ? 0 : c,
        d = d == undefined ? ',' : d,
        t = t == undefined ? '.' : t,
        s, i, j;
    
    var regescape = function(text) { return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"); }
    
    if (typeof(n) == typeof("a")) {
        n = parseFloat(n.replace(RegExp(regescape(t), 'g'),'').replace(RegExp(regescape(d)),'.'));
    }
    s = n < 0 ? "-" : "";
    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "";
    j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
}

var areaChart;
var jSONs = {};

function init() {
    var json = {{ json }};
    jSONs[{{ sifra }}] = {{ json }};
    areaChart = new $jit.AreaChart({
      //id of the visualization container
      injectInto: 'infovis',
      //add animations
      animate: false,
      //separation offsets
      Margin: {
        top: 5,
        left: 100,
        right: 100,
        bottom: 5
      },
      labelOffset: 10,
      //whether to display sums
      showAggregates: function (name, val, val2, val3) {
        // return true;
        return format_money(val) + ' EUR';
      },
      //whether to display labels at all
      showLabels: true,
      //could also be 'stacked'
      type: useGradients? 'stacked:gradient' : 'stacked',
      //label styling
      Label: {
        type: labelType, //can be 'Native' or 'HTML'
        size: 13,
        family: 'Arial',
        color: 'white'
      },
      //enable tips
      Tips: {
        enable: true,
        onShow: function(tip, elem) {
          tip.innerHTML = "<b>" + elem.name + "</b>: <br />" + format_money(elem.value) + ' EUR';
        }
      },
      Events: {
        enable: true,
        onClick: function (node, eventInfo, e) {
          //console.log(node);
          if (node) {
            var postavka = node.name.match(/^(\d+)/)[0];
            if ((postavka > 9999 && postavka < 100000) || postavka > 999999) {
              return true;
            }
            document.location.hash = '#' + postavka;
            add_subchart(postavka);
          }
        },
        onRightClick: function (node, eventInfo, e) {
          var curjson, postavka = document.location.hash.match(/^#(\d+)/);
          if (!postavka) return;
          if (postavka[1].length == 6) {
            postavka = postavka[1];
            postavka = postavka.substr(0, postavka.length-2);
          } else {
            postavka = postavka[1];
            postavka = postavka.substr(0, postavka.length-1);
          }
          if (postavka.length < 2) {
            postavka = '0';
          }
          curjson = jSONs[postavka];
          if (typeof(curjson) == 'undefined') {
            add_subchart(postavka, function () {
              var cj = jSONs[postavka];
              $('#title')[0].innerHTML = cj.title + " {{ extratitle }}";
            });
          } else {
            areaChart.loadJSON(curjson);
            $('#title')[0].innerHTML = curjson.title + " {{ extratitle }}";
          }
          if (postavka.length > 1) {
            document.location.hash = '#' + postavka;
          } else {
            document.location.hash = '';
          }
        }
      },
      //add left and right click handlers
      selectOnHover: true,
      filterOnClick: false,
      restoreOnRightClick: false
    });
    //load JSON data.
    areaChart.loadJSON(json);

    if (document.location.hash) {
      var postavka = document.location.hash.match(/^#(\d+)/)[1];
      if (postavka > 9 && postavka <= 9999) {
        add_subchart(Math.round(postavka / 10), function() {
          add_subchart(postavka);
        });
      } else if (postavka > 99999 && postavka <= 999999) {
        add_subchart(Math.round(postavka / 100), function() {
          add_subchart(postavka);
        });
      }
    }
}
{% else %}
(function () {
  var jsn = {{ json }};
  jSONs[{{ sifra }}] = jsn;
  areaChart.loadJSON(jsn);
  $('#title')[0].innerHTML = jsn.title + ' {{ extratitle }}';
  if (jsn.title.match(/^#(\d+)/)) {
    document.location.hash = '#' + jsn.title.match(/^#(\d+)/)[1];
  }
})();
{% endif %}
