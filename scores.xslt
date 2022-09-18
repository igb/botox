<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	    <xsl:output method="html"/>
	    <xsl:template match="results">
	    <xsl:variable name="best" select="best-result/score"/>
	    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>

<meta charset="utf-8"/>

<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>

<!-- Create a div where the graph will take place -->
<div id="my_dataviz"></div>


<script>

var best=<xsl:value-of select="$best"/>

// set the dimensions and margins of the graph
var margin = {top: 10, right: 30, bottom: 30, left: 60},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
var svg = d3.select("#my_dataviz")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin.left + "," + margin.top + ")");
 

<xsl:apply-templates select="data"/>
  // Add X axis
  var x = d3.scaleLinear()
    .domain([-1, data.length])
    .range([ 0, width ]);
  svg.append("g")
    .attr("transform", "translate(0," + height + ")")
    .call(d3.axisBottom(x));

  // Add Y axis
  var y = d3.scaleLinear()
    .domain([0, 100])
    .range([ height, 0]);
  svg.append("g")
    .call(d3.axisLeft(y));

  // Add dots
  svg.append('g')
    .selectAll("dot")
    .data(data)
    .enter()
    .append("circle")
      .attr("cx", function (d) { return x(d.run); } )
      .attr("cy", function (d) { return y(d.score); } )
      .attr("r", 5)
      .style("fill", function (d) { console.log(d.score + " " +  best);return d.score == best ? "#FFA500" :  "#69b3a2"; } )





</script></xsl:template>
	    <xsl:template match="data">var data=[<xsl:apply-templates select="row"/>]</xsl:template>		
	    <xsl:template match="row">{run:<xsl:value-of select="trial_index"/>,score:<xsl:value-of select="score"/>},<xsl:text>
</xsl:text></xsl:template>
</xsl:stylesheet>
