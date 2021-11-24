class Rule {
 String layerClass;
 String attribute;
 String probability;
 Rule(String[] properties){
   layerClass = properties[0];
   attribute = properties[1];
   probability = properties[2]; 
 }
}
