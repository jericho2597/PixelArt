const basePath = process.cwd();
const { MODE } = require(`${basePath}/constants/blend_mode.js`);
const { NETWORK } = require(`${basePath}/constants/network.js`);

const network = NETWORK.eth;

// General metadata for Ethereum
const namePrefix = "LoFi Ape Society";
const description = "A new breed of Ape has evolved, with low enough resolution to infiltrate the block chain. The LoFi Ape Society is a collection of 10,000 unique LoFi Ape NFTs; truly unique digital collectibles on the Ethereum blockchain. Future bonuses for LoFi Ape holders can be unlocked by the community through roadmap activation.";
const baseUri = "ipfs://QmQvZj5bFKPAQmHhWALy3g9iG3fVSjSL4tKK47XaqvuoCt";

const solanaMetadata = {
  symbol: "YC",
  seller_fee_basis_points: 250, // Define how much % you want from secondary market sales 1000 = 10%
  external_url: "https://www.youtube.com/c/hashlipsnft",
  creators: [
    {
      address: "7fXNuer5sbZtaTEPhtJ5g5gNtuyRoKkvxdjEjEnPN4mC",
      share: 100,
    },
  ],
};

// If you have selected Solana then the collection starts from 0 automatically
const layerConfigurations = [
  {
    growEditionSizeTo: 25,
    layersOrder: [
      { name: "Background" },
      { name: "Skin Special" },
      { name: "Apparel" },
      { name: "Mouth Special" },
      { name: "Eyes Special" },
      { name: "Hair Special" },
    ],
  },
  {
    growEditionSizeTo: 50,
    layersOrder: [
      { name: "Background" },
      { name: "Skin" },
      { name: "Apparel" },
      { name: "Mask" },
    ],
  },
  {
    growEditionSizeTo: 10000,
    layersOrder: [
      { name: "Background" },
      { name: "Skin" },
      { name: "Apparel" },
      { name: "Mouth" },
      { name: "Eyes" },
      { name: "Headwear" },
    ],
  },
];

const shuffleLayerConfigurations = true;

const debugLogs = false;

const format = {
  width: 448,
  height: 448,
  smoothing: false,
};

const gif = {
  export: false,
  repeat: 0,
  quality: 100,
  delay: 500,
};

const text = {
  only: false,
  color: "#ffffff",
  size: 20,
  xGap: 40,
  yGap: 40,
  align: "left",
  baseline: "top",
  weight: "regular",
  family: "Courier",
  spacer: " => ",
};

const pixelFormat = {
  ratio: 2 / 128,
};

const background = {
  generate: true,
  brightness: "80%",
  static: false,
  default: "#000000",
};

const extraMetadata = {};

const rarityDelimiter = "#";

const uniqueDnaTorrance = 10000;

const preview = {
  thumbPerRow: 5,
  thumbWidth: 50,
  imageRatio: format.height / format.width,
  imageName: "preview.png",
};

const preview_gif = {
  numberOfImages: 10,
  order: "MIXED", // ASC, DESC, MIXED
  repeat: 0,
  quality: 100,
  delay: 500,
  imageName: "preview.gif",
};

module.exports = {
  format,
  baseUri,
  description,
  background,
  uniqueDnaTorrance,
  layerConfigurations,
  rarityDelimiter,
  preview,
  shuffleLayerConfigurations,
  debugLogs,
  extraMetadata,
  pixelFormat,
  text,
  namePrefix,
  network,
  solanaMetadata,
  gif,
  preview_gif,
};
