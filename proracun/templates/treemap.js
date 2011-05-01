function init() {
    var json = {{ json }};
    TM.Squarified.implement({
        'setColor': function(json) {
            return json.data.$color;
        }
    });

    var tm = new TM.Squarified({
                //Where to inject the Treemap
                rootId: 'infovis',
                addLeftClickHandler: true,
                addRightClickHandler: true,
                Color: {
                    allow: true,
                    minValue: 0,
                    maxValue: 100,
                    minColorValue: [0, 150, 50],
                    maxColorValue: [255, 0, 50] 
                },
                Tips: {
                    allow: true,
                    offsetX: 20,
                    offsetY: 20,
                    onShow: function(tip, node, isLeaf, domElement) {
                        tip.innerHTML = "<b>" + node.data.znesek + " EUR</b>";
                    }
                }
    });
            //load JSON data
    tm.loadJSON(json);
}

