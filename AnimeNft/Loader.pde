import java.util.*;

class Loader {
 
  public ArrayList<Layer> SilhouetteLayers = new ArrayList<Layer>();
  public ArrayList<Layer> HairLayers = new ArrayList<Layer>();
  public ArrayList<Layer> EyesLayers = new ArrayList<Layer>();
  public ArrayList<Layer> ApparelLayers = new ArrayList<Layer>();
  public ArrayList<Layer> MouthLayers = new ArrayList<Layer>();
  public ArrayList<Layer> MaskLayers = new ArrayList<Layer>();
  public ArrayList<Layer> WeaponLayers = new ArrayList<Layer>();
  public ArrayList<Layer> ScarLayers = new ArrayList<Layer>();
  public ArrayList<Layer> BackgroundLayers = new ArrayList<Layer>();
  
  ArrayList<Layer> getSet(String type){
    if(type == "silhouette"){
      return SilhouetteLayers;
    }
    else if(type == "hair"){
      return HairLayers;
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
    else if(type == "mask"){
      return MaskLayers;
    }
    else if(type == "weapon"){
      return WeaponLayers;
    }
    else if(type == "scar"){
      return ScarLayers;
    }
    else{
      return BackgroundLayers;
    }
  }
  
  void loadAllSilhouette() {
    // One line per hair layer to be loaded into collection
    
    // EXAMPLE
    loadSilhouette("layers/Skin/yellowskin.png", "s2", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSilhouette("layers/Skin/lighterskin.png", "s3", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadSilhouette("layers/Skin/darkskin.png", "s4", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
  }

  void loadAllHair() {
    // One line per hair layer to be loaded into collection
    
    // EXAMPLE
    loadHair("layers/Hair/slick.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/blondeslick.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});  
    loadHair("layers/Hair/Hair-bandana-blue.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/Hair-bandana-red.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/Hair-messy-yellow.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/Hair-messy-silver.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/Hair-red-middle-part.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/blondmidlength.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/bluemidlength.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/darkmidlength.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/greenbeanie.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/greybeanie.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/mohawkblack.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Hair/mohawkblonde.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});

}
  
  void loadAllEyes() {
    // One line per hair layer to be loaded into collection
    
    // EXAMPLE
    loadEyes("layers/Eyes/fullyblazed.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/blondefullyblazed.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});  
    loadEyes("layers/Eyes/smalleyes.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadEyes("layers/Eyes/sus.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Eyes/blackglasses.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Eyes/brownshadeglasses.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadHair("layers/Eyes/bluespecs.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});

}

  void loadAllApparel() {
    // One line per hair layer to be loaded into collection
    loadApparel("layers/Apparel/blueshirt.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/greenshirt.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/brownblazer.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/mafiasuit.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/redshirt.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/singlet.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/SIlhouette-black-suit-red-tie.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/SIlhouette-black-blazer-pink-shirt.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/SIlhouette-demin-chain.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/SIlhouette-demin-red-chain.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/SIlhouette-purple-blazer.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadApparel("layers/Apparel/SIlhouette-shirtless-chain.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});

  }

  void loadAllMouths() {
    // One line per hair layer to be loaded into collection
    loadMouth("layers/Mouth/normal.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadMouth("layers/Mouth/goatee.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/blondegoatee.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/cigaretteinmouth.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/johnwick.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
    loadMouth("layers/Mouth/blondbeard.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});    
  }

  void loadAllMasks() {
  }

  void loadAllWeapons() {
  }

  void loadAllScars() {
  }

  void loadAllBackgrounds() {
    // One line per hair layer to be loaded into collection
    loadBackground("layers/Background/bluebackground.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
    loadBackground("layers/Background/purplebackground.png", "s1", new ArrayList<String>(Arrays.asList(new String[]{})), new String[]{});
  }
  
  public Loader(){
      loadAllSilhouette();
      loadAllHair();
      loadAllEyes();
      loadAllApparel();
      loadAllMouths();
      //loadAllMasks();
      //loadAllWeapons();
      //loadAllScars();
      loadAllBackgrounds();
  }
  
  void loadSilhouette(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    SilhouetteLayers.add(new Layer(imageFilePath, code, "silhouette", attributes, rules, false));
  }
  
  void loadHair(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    HairLayers.add(new Layer(imageFilePath, code, "hair", attributes, rules, false));
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

  void loadMask(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    MaskLayers.add(new Layer(imageFilePath, code, "mask", attributes, rules, false));
  }

  void loadWeapon(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    WeaponLayers.add(new Layer(imageFilePath, code, "weapon", attributes, rules, false));
  }

  void loadScar(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    ScarLayers.add(new Layer(imageFilePath, code, "scar", attributes, rules, false));
  }

  void loadBackground(String imageFilePath, String code, ArrayList<String> attributes, String[] rules){
    BackgroundLayers.add(new Layer(imageFilePath, code, "background", attributes, rules, false));
  }
}
