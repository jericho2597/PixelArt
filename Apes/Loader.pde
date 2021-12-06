import java.util.*;

class Loader {
 
  public ArrayList<Layer> SkinLayers = new ArrayList<Layer>();
  public ArrayList<Layer> EyesLayers = new ArrayList<Layer>();
  public ArrayList<Layer> MouthLayers = new ArrayList<Layer>();
  public ArrayList<Layer> ApparelLayers = new ArrayList<Layer>();
  
  ArrayList<Layer> getSet(String type){
    if(type == "skin"){
      return SkinLayers;
    }
    else if(type == "eyes"){
      return EyesLayers;
    }
    else if(type == "apparel"){
      return ApparelLayers;
    }
    else if(type == "mouth"){
      return MouthLayers;
    }
    return null;
  }
  
  void loadAllSkin() {
    // One line per hair layer to be loaded into collection
    
    // EXAMPLE
    loadSkin("layers/Skin/Skin1.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin2.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin3.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin4.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin5.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin6.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin7.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin8.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin9.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/Skin10.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSkin("layers/Skin/TigerSkin.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});

}
  
  void loadAllEyes() {
    // One line per hair layer to be loaded into collection
    
    // EXAMPLE
    loadEyes("layers/Eyes/AngryEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/AnimeBlueEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});  
    loadEyes("layers/Eyes/AnimePinkEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/ClosedEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/Cucumber.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/WideOpenEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/BatApe.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/BloodshotEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/Eyepatch.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});  
    loadEyes("layers/Eyes/Glasses1.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/Glasses2.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/ZombieEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/PinkEyeShadow.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/PlainEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/PurpleEyeShadow.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/RedGlare.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});  
    loadEyes("layers/Eyes/SadBoiEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/SingleSpectacle.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/SkiMask.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/SleepyEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/WideOpenBloodshotEyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
}

  void loadAllApparel() {
    // One line per hair layer to be loaded into collection
    loadApparel("layers/Apparel/apparel-black-jacket.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-blue-jacket.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-brown-jacket-black-turtle.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-pink-floral.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-purple-jacket.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-purple-ninja.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-red-jacket.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-red-jumper-chain.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-red-suit.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-shirtless-stabbed.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/apparel-whitetee-chain.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
  }

  void loadAllMouths() {
    // One line per hair layer to be loaded into collection
    loadMouth("layers/Mouth/AwkwardSmile.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadMouth("layers/Mouth/AwkwardSmileGoldTooth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/BackwardCigarette.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/BlackLipstick.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/DroolMouth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/DroolTongue.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/MouthAngry.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/MouthCalm.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/MouthCigarette.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/MouthHngggg.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadMouth("layers/Mouth/MouthLazy.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/MouthPipe.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/OpenMouth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/RedLipStick.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/SnotMouth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/TongueOut.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/TrollGrin.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/TrollGrinGoldTeeth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/UpturnedMouth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/VampireTeeth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
}

  public Loader(){
      loadAllSkin();
      loadAllEyes();
      loadAllApparel();
      loadAllMouths();
  }
  
  void loadSkin(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    SkinLayers.add(new Layer(imageFilePath, code, "silhouette", attributes, rules, false));
  }
  
  void loadEyes(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    EyesLayers.add(new Layer(imageFilePath, code, "eyes", attributes, rules, false));
  }

  void loadApparel(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    ApparelLayers.add(new Layer(imageFilePath, code, "apparel", attributes, rules, false));
  }

  void loadMouth(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    MouthLayers.add(new Layer(imageFilePath, code, "mouth", attributes, rules, false));
  }
}
