<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레이어 팝업 테스트</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/broken-axis.js"></script>

<script>
$(function () {
var x=50000;
var y=10000;
var z=x-y;
var r=0;
var a=0;
var b=0;
if(x>y){
	a=y*0.9;
	b=x*0.9;
}
else {
	a=x*0.9;
	b=y*0.9;
}
console.log("a"+a+"b"+b);
    /**
     * Extend the Axis.getLinePath method in order to visualize breaks with two parallel
     * slanted lines. For each break, the slanted lines are inserted into the line path.
     */
    Highcharts.wrap(Highcharts.Axis.prototype, 'getLinePath', function (proceed, lineWidth) {
        var axis = this,
            path = proceed.call(this, lineWidth),
            x = path[1],
            y = path[2];

        Highcharts.each(this.breakArray || [], function (brk) {
            if (axis.horiz) {
                x = axis.toPixels(brk.from);
                path.splice(3, 0,
                    'L', x - 4, y, // stop
                    'M', x - 9, y + 5, 'L', x + 1, y - 5, // left slanted line
                    'M', x - 1, y + 5, 'L', x + 9, y - 5, // higher slanted line
                    'M', x + 4, y
                );
            } else {
                y = axis.toPixels(brk.from);
                path.splice(3, 0,
                    'L', x, y - 4, // stop
                    'M', x + 5, y - 9, 'L', x - 5, y + 1, // lower slanted line
                    'M', x + 5, y - 1, 'L', x - 5, y + 9, // higher slanted line
                    'M', x, y + 4
                );
            }
        });
        return path;
    });

    /**
     * On top of each column, draw a zigzag line where the axis break is.
     */
    function pointBreakColumn(e) {
        var point = e.point,
            brk = e.brk,
            shapeArgs = point.shapeArgs,
            x = shapeArgs.x,
            y = this.translate(brk.from, 0, 1, 0, 1),
            w = shapeArgs.width,
            key = ['brk', brk.from, brk.to],
            path = ['M', x, y, 'L', x + w * 0.25, y + 4, 'L', x + w * 0.75, y - 4, 'L', x + w, y];

        if (!point[key]) {
            point[key] = this.chart.renderer.path(path)
                .attr({
                    'stroke-width': 2,
                    stroke: point.series.options.borderColor
                })
                .add(point.graphic.parentGroup);
        } else {
            point[key].attr({
                d: path
            });
        }
    }

    $('#container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Visualized axis break'
        },
        xAxis: {
            categories: ['이번달']
        },
        yAxis: {
            lineColor: 'black',
            lineWidth: 3,
            title: false,
            tickInterval: 100,
            
            events: {
                pointBreak: pointBreakColumn
            }
        },
        series: [{
            name: '총수입',
            data: [x]
        }, {
            name: '총지출',
            data: [y]
        
        },
        {
            name: '총매출',
            data: [z]
        }
        ]

    });
});
</script>



<div id="container" style="height: 400px"></div>
</head>
<body>

</body>
</html>