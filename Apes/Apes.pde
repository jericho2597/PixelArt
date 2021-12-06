
/*

  RULE GRAMMAR
  
  Components:
   - LAYER: the name of a type of layer, or a "*" which means the rule is applied to all layers
   - ATTRIBUTE: a string that can belong to a layer describing it. Layers can have many attributes.
   - PROBABILITY: the probability that this rule is enforced (0.0-1.0)
   - ; is used as a delimeter and should not be contained in any components strings
   
  Statements:
  
      RULE = LAYER;ATTRIBUTE;PROBABILITY;

      The above rule is the only rule need for this generative art algorithm. 
      It specifies a type of layer that the rule is applied to (e.g Hair, Eyes etc), an attribute that this 
      layer could potentially have, and a probability that the rule is enforced.
      
  Examples:
  
      hair;blonde;0.5;       
        - this rule specifies that when the hair layer is selected, there is a 50% chance the hair layer will have
          the attribute 'blonde'
          
      eyes;happy;1.0;
        - this rule specifies that when the eye layer is selected, it must have the happy attribute
        
      weapon;sci-fi;0.0;
        - this rule specifies that when the weapon layer is selected, it will not have the sci-fi attribute
      
  How Rules Are Applied;
  
      As layers are selected, any rules they contain will be collected in a group that will be applied to successive 
      layer selections for the same run/task.
      
*/

int totalPopulation = 10;
int frames = 2;

void setup(){
  
  size(448, 448);
  
  background(200);
  
}

// BEING TO LOAD IN ALL DATA
Loader data = new Loader();

void draw(){
  ArrayList<String> order = new ArrayList<String>();
  order.add("skin");
  order.add("apparel");
  order.add("eyes");
  order.add("mouth");
  
  for(int i = 0; i < totalPopulation; i++){
    clear();
    background(200);
    ArrayList<Rule> rules = new ArrayList<Rule>();
    ArrayList<Layer> layers = new ArrayList<Layer>();
    for(String featureName: order){
      ArrayList<Layer> features = data.getSet(featureName);
      
      // filter features based on rules
      features = getFilteredFeatures(features, rules, featureName);
      
      Layer layer = getRandomFeature(features);
      for(int x = 0; x < layer.rules.length; x++){
        rules.add(new Rule(layer.rules[x].split(";")));
      }
      layers.add(layer);
    }
    for(int f = 1; f <= frames; f++){
      for(Layer layer: layers){
        if(layer.isGif){
          image(loadImage(layer.getGifFrameFilePath(f)), 0, 0);
        }
        else{
          image(loadImage(layer.imageFilePath), 0, 0); 
        }
      }
      
      saveFrame("outpus/"+i+"/nft"+f+".png");
      delay(1);
    }
    
  }
}

Layer getRandomFeature(ArrayList<Layer> features){
  return features.get((int)Math.floor(random(features.size())));
}

ArrayList<Layer> getFilteredFeatures(ArrayList<Layer> features, ArrayList<Rule> rules, String featureName){
  
  ArrayList<Rule> applicableRules = new ArrayList<Rule>();
  
  for(Rule rule : rules){
   if(rule.layerClass.equals(featureName) || rule.layerClass.equals("*")){
    if(random(1) < Float.parseFloat(rule.probability)){
      applicableRules.add(rule);
    }
   }
  }
  
  ArrayList<Layer> filteredFeatures = new ArrayList<Layer>();
  
  for(Layer feature : features){
   boolean add = true;
   
   for(Rule rule : applicableRules){
     if(!feature.attributes.contains(rule.attribute)){
       add = false;
       break;
     }
   }
   
   if(add){
    filteredFeatures.add(feature); 
   }
  }
  
  return filteredFeatures;
}
  
