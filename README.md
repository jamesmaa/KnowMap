CourseShare-KnowledgeMap
========================

Knowledge Map interface for CourseShare

For something simple: In the graphiz directory is the script
generate_graph.rb. It takes three parameters <concept csv file> <group csv file>
and <output header> and will output a .map file and .pdf of the graph. The .map
file is for graphiz and the .pdf file is the actual graph graphiz generates.

Example: ./generate_graph.rb concepts.csv groups.csv ../graphs/cs161