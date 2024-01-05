<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:math="http://exslt.org/math"
		xmlns:func="http://exslt.org/functions"
		version="1.0">
	    <xsl:output method="html"/>

<xsl:template match="results">
	    <xsl:variable name="best" select="best-result/score"/>
	    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
<xsl:variable name="uid">
  <!-- 8 -->
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:text>_</xsl:text>      
        <!-- 4 -->
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <!-- version identifier -->
        <xsl:text>_</xsl:text>     
        <!-- 3 -->
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:text>_</xsl:text>      
        <!-- 1* -->
        <xsl:value-of select="substring('89ab', floor(4*math:random()) + 1, 1)" />
        <!-- 3 -->
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:text>_</xsl:text>      
        <!-- 12 -->
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" />
        <xsl:value-of select="substring('0123456789abcdef', floor(16*math:random()) + 1, 1)" /> 
</xsl:variable>
<html>
<body>


<!-- Load d3.js -->
<script src="https://d3js.org/d3.v4.js"></script>

<!-- Create a div where the graph will take place -->
<div><xsl:attribute name="id">my_dataviz_<xsl:value-of select="$uid"/></xsl:attribute></div>


<script>

var best_<xsl:value-of select="$uid"/>=<xsl:value-of select="$best"/>

// set the dimensions and margins of the graph
var margin_<xsl:value-of select="$uid"/> = {top: 10, right: 30, bottom: 30, left: 60},
    width_<xsl:value-of select="$uid"/> = 460 - margin_<xsl:value-of select="$uid"/>.left - margin_<xsl:value-of select="$uid"/>.right,
    height_<xsl:value-of select="$uid"/> = 400 - margin_<xsl:value-of select="$uid"/>.top - margin_<xsl:value-of select="$uid"/>.bottom;

// append the svg object to the body of the page
var svg_<xsl:value-of select="$uid"/> = d3.select(&quot;#my_dataviz_<xsl:value-of select="$uid"/>&quot;)
  .append("svg")
    .attr("width", width_<xsl:value-of select="$uid"/> + margin_<xsl:value-of select="$uid"/>.left + margin_<xsl:value-of select="$uid"/>.right)
    .attr("height", height_<xsl:value-of select="$uid"/> + margin_<xsl:value-of select="$uid"/>.top + margin_<xsl:value-of select="$uid"/>.bottom)
  .append("g")
    .attr("transform",
          "translate(" + margin_<xsl:value-of select="$uid"/>.left + "," + margin_<xsl:value-of select="$uid"/>.top + ")");
 

<xsl:apply-templates select="data">
  <xsl:with-param name="uid" select = "$uid" />
</xsl:apply-templates>
  // Add X axis
  var x_<xsl:value-of select="$uid"/> = d3.scaleLinear()
    .domain([-1, data_<xsl:value-of select="$uid"/>.length])
    .range([ 0, width_<xsl:value-of select="$uid"/> ]);
  svg_<xsl:value-of select="$uid"/>.append("g")
    .attr("transform", "translate(0," + height_<xsl:value-of select="$uid"/> + ")")
    .call(d3.axisBottom(x_<xsl:value-of select="$uid"/>));

  // Add Y axis
  var y_<xsl:value-of select="$uid"/> = d3.scaleLinear()
    .domain([0, 100])
    .range([ height_<xsl:value-of select="$uid"/>, 0]);
  svg_<xsl:value-of select="$uid"/>.append("g")
    .call(d3.axisLeft(y_<xsl:value-of select="$uid"/>));

  // Add dots
  svg_<xsl:value-of select="$uid"/>.append('g')
    .selectAll("dot")
    .data(data_<xsl:value-of select="$uid"/>)
    .enter()
    .append("circle")
      .attr("cx", function (d) { return x_<xsl:value-of select="$uid"/>(d.run); } )
      .attr("cy", function (d) { return y_<xsl:value-of select="$uid"/>(d.score); } )
      .attr("r", 5)
      .style("fill", function (d) { console.log(d.score + " " +  best_<xsl:value-of select="$uid"/>);if (d.score == best_<xsl:value-of select="$uid"/>) { return "#FFA500" } else if (d.score == -1) { return "#ff0000" } else { return "#69b3a2"; } } )





</script>
</body>
</html>
</xsl:template>
	    <xsl:template match="data"><xsl:param name = "uid" />
<xsl:text>var data_</xsl:text><xsl:value-of select="$uid"/><xsl:text>=[</xsl:text><xsl:apply-templates select="row"/><xsl:text>]</xsl:text></xsl:template>		
	    <xsl:template match="row">{run:<xsl:value-of select="trial_index"/>,score:<xsl:value-of select="score"/>},<xsl:text>
</xsl:text></xsl:template>
</xsl:stylesheet>
