class Layer {
   String imageFilePath;
   String code;
   String layerClass; // the class that this layer belongs to e.g. Hair, Eyes etc
   ArrayList<String> attributes; // an array of the attributes this feature possess.
   String[] rules;
   boolean isGif;
   
   public Layer(String imageFilePath, String code, String layerClass, ArrayList<String> attributes, String[] rules, boolean isGif){
     this.imageFilePath = imageFilePath;
     this.code = code;
     this.layerClass = layerClass;
     this.attributes = attributes;
     this.rules = rules;
     this.isGif = isGif;
   }
   
   // assumes that the feature is a GIF with a folder of images at path
   // imageFilePath/
   //      - 1.png
   //      - 2.png
   //      - ...
   public String getGifFrameFilePath(int frame){
     return imageFilePath + "/" + frame + ".png";
   }
}
