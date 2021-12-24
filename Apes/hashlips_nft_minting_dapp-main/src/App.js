import React, { useEffect, useState, useRef } from "react";
import { useDispatch, useSelector } from "react-redux";
import { connect } from "./redux/blockchain/blockchainActions";
import { fetchData } from "./redux/data/dataActions";
import * as s from "./styles/globalStyles";
import { HashLink } from 'react-router-hash-link';
import styled from "styled-components";
import VerticalTimeline from './components'
import { events } from "./components/events"
import background from './yes.gif'

const truncate = (input, len) =>
  input.length > len ? `${input.substring(0, len)}...` : input;
export const StyledButton = styled.button`
  padding: 10px;
  border-radius: 50px;
  border: none;
  background-color: var(--secondary);
  padding: 10px;
  font-weight: bold;
  color: var(--secondary-text);
  width: 100px;
  cursor: pointer;
  box-shadow: 0px 6px 0px -2px rgba(250, 250, 250, 0.3);
  -webkit-box-shadow: 0px 6px 0px -2px rgba(250, 250, 250, 0.3);
  -moz-box-shadow: 0px 6px 0px -2px rgba(250, 250, 250, 0.3);
  :active {
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
  }
`;

export const StyledRoundButton = styled.button`
  padding: 10px;
  border-radius: 100%;
  border: none;
  background-color: var(--primary);
  padding: 10px;
  font-weight: bold;
  font-size: 15px;
  color: var(--primary-text);
  width: 30px;
  height: 30px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0px 4px 0px -2px rgba(250, 250, 250, 0.3);
  -webkit-box-shadow: 0px 4px 0px -2px rgba(250, 250, 250, 0.3);
  -moz-box-shadow: 0px 4px 0px -2px rgba(250, 250, 250, 0.3);
  :active {
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
  }
`;

export const ResponsiveWrapper = styled.div`
  display: flex;
  flex: 1;
  flex-direction: column;
  justify-content: stretched;
  align-items: stretched;
  width: 100%;
  @media (min-width: 767px) {
    flex-direction: row;
  }
`;

export const StyledLogo = styled.img`
  width: 300px;
  @media (min-width: 767px) {
    width: 500px;
  }
  transition: width 0.5s;
  transition: height 0.5s;
`;

export const StyledImg = styled.img`
  box-shadow: 0px 5px 11px 2px rgba(0, 0, 0, 0.7);
  border: 4px dashed var(--secondary);
  background-color: var(--accent);
  border-radius: 100%;
  width: 200px;
  @media (min-width: 900px) {
    width: 250px;
  }
  @media (min-width: 1000px) {
    width: 300px;
  }
  transition: width 0.5s;
`;

export const StyledLink = styled.a`
  color: var(--secondary);
  text-decoration: none;
`;

function App() {
  const dispatch = useDispatch();
  const blockchain = useSelector((state) => state.blockchain);
  const data = useSelector((state) => state.data);
  const [claimingNft, setClaimingNft] = useState(false);
  const [feedback, setFeedback] = useState(`Click buy to mint your NFT.`);
  const [mintAmount, setMintAmount] = useState(1);
  const [CONFIG, SET_CONFIG] = useState({
    CONTRACT_ADDRESS: "",
    SCAN_LINK: "",
    NETWORK: {
      NAME: "",
      SYMBOL: "",
      ID: 0,
    },
    NFT_NAME: "",
    SYMBOL: "",
    MAX_SUPPLY: 1,
    WEI_COST: 0,
    DISPLAY_COST: 0,
    GAS_LIMIT: 0,
    MARKETPLACE: "",
    MARKETPLACE_LINK: "",
    SHOW_BACKGROUND: false,
  });

  const claimNFTs = () => {
    let cost = CONFIG.WEI_COST;
    let gasLimit = CONFIG.GAS_LIMIT;
    let totalCostWei = String(cost * mintAmount);
    let totalGasLimit = String(gasLimit * mintAmount);
    console.log("Cost: ", totalCostWei);
    console.log("Gas limit: ", totalGasLimit);
    setFeedback(`Minting your ${CONFIG.NFT_NAME}...`);
    setClaimingNft(true);
    blockchain.smartContract.methods
      .mint(mintAmount)
      .send({
        gasLimit: String(totalGasLimit),
        to: CONFIG.CONTRACT_ADDRESS,
        from: blockchain.account,
        value: totalCostWei,
      })
      .once("error", (err) => {
        console.log(err);
        setFeedback("Sorry, something went wrong please try again later.");
        setClaimingNft(false);
      })
      .then((receipt) => {
        console.log(receipt);
        setFeedback(
          `WOW, the ${CONFIG.NFT_NAME} is yours! go visit Opensea.io to view it.`
        );
        setClaimingNft(false);
        dispatch(fetchData(blockchain.account));
      });
  };

  const decrementMintAmount = () => {
    let newMintAmount = mintAmount - 1;
    if (newMintAmount < 1) {
      newMintAmount = 1;
    }
    setMintAmount(newMintAmount);
  };

  const incrementMintAmount = () => {
    let newMintAmount = mintAmount + 1;
    if (newMintAmount > 10) {
      newMintAmount = 10;
    }
    setMintAmount(newMintAmount);
  };

  const getData = () => {
    if (blockchain.account !== "" && blockchain.smartContract !== null) {
      dispatch(fetchData(blockchain.account));
    }
  };

  const getConfig = async () => {
    const configResponse = await fetch("/config/config.json", {
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
      },
    });
    const config = await configResponse.json();
    SET_CONFIG(config);
  };

  useEffect(() => {
    getConfig();
  }, []);

  useEffect(() => {
    getData();
  }, [blockchain.account]);

  return (
        <s.Screen image={background}>
          <s.Container
            flex={1}
            ai={"center"}
            style={{ minWidth: 400,width: '60%', padding: 24, backgroundColor: "var(--primary)" }}
            image={CONFIG.SHOW_BACKGROUND ? "/config/images/bg.png" : null}
          >
            <StyledLogo alt={"logo"} src={"/config/images/logo.png"} />
          </s.Container>

          <s.Container
            flex={1}
            ai={"center"}
            style={{ minWidth: 400,width: '60%', padding: 24, backgroundColor: "var(--secondary)" }}
            image={CONFIG.SHOW_BACKGROUND ? "/config/images/bg.png" : null}
          >
            <div style={{display: "flex", flexDirection: "row", paddingLeft: "10px"}}>
              <div style={{display: "flex", flexDirection: "row"}}>
                <img width={200} height={200} src={"5.png"} style={{margin: 2}}/>
                <img width={200} height={200} src={"3.png"} style={{margin: 2}}/>
              </div>
              <div style={{display: "flex", flexDirection: "row"}}>
                <img width={200} height={200} src={"4.png"} style={{margin: 2}}/>
                <img width={200} height={200} src={"5.png"} style={{margin: 2}}/>
              </div>
            </div>
            <div style={{display: "flex", flexDirection: "row", paddingLeft: "10px"}}>
              <div style={{display: "flex", flexDirection: "row"}}>
                <img width={200} height={200} src={"5.png"} style={{margin: 2}}/>
                <img width={200} height={200} src={"3.png"} style={{margin: 2}}/>
              </div>
              <div style={{display: "flex", flexDirection: "row"}}s>
                <img width={200} height={200} src={"4.png"} style={{margin: 2}}/>
                <img width={200} height={200} src={"5.png"} style={{margin: 2}}/>
              </div>
            </div>
            <s.Container jc={"center"} ai={"center"} style={{ width: "70%" }}>
              <s.TextTitle
                style={{ textAlign: "left", color: "var(--para-header)" }}
              >
                Welcome to the LoFi Ape Society
              </s.TextTitle>
              <s.TextDescription
                style={{
                  textAlign: "justify",
                  color: "var(--primary-text)",
                }}
              >
                A new breed of Ape has evolved, with low enough resolution to infiltrate the blockchain. The LoFi Ape Society is a collection of 10,000 unique LoFi Ape NFTs; certifiably unique digital collectibles on the Ethereum blockchain. Future bonuses for LoFi Ape holders can be unlocked by the community through roadmap activation, see below to find out more.
              </s.TextDescription>
            </s.Container>
          </s.Container>

          <s.Container
            flex={1}
            ai={"center"}
            style={{ minWidth: 400,width: '60%', padding: 24, backgroundColor: "var(--primary)" }}
            image={CONFIG.SHOW_BACKGROUND ? "/config/images/bg.png" : null}
          >
            <s.Container jc={"center"} ai={"center"} style={{ width: "70%" }}>
              <s.TextTitle
                style={{ textAlign: "left", color: "var(--accent)" }}
              >
                Generation
              </s.TextTitle>
              <s.TextDescription
                style={{
                  textAlign: "justify",
                  color: "var(--primary-text)",
                }}
              >
                Each LoFi Ape is a unique programmatically generated image, derived from over 140 different features, such as eyes, mouths, headwear, apparel and more. All LoFi apes are created rare, however, some are more rare than others.
              </s.TextDescription>
              <s.SpacerSmall />
              <s.TextDescription
                style={{
                  textAlign: "justify",
                  color: "var(--primary-text)",
                }}
              >
                To access the members-only features unlocked by roadmap activation, LoFi Ape owners will need to sign into their Metamask Wallet.
              </s.TextDescription>
              <s.SpacerSmall />
              <s.TextDescription
                style={{
                  textAlign: "justify",
                  color: "var(--primary-text)",
                }}
              >
                The LoFi Apes are stored as ERC-721 tokens on the Ethereum blockchain and hosted on IPFS. Minting an ape costs 0.05 ETH.
              </s.TextDescription>
            </s.Container>
          </s.Container>

          <s.Container
            flex={1}
            ai={"center"}
            style={{ minWidth: 400,width: '60%', padding: 24, backgroundColor: "var(--secondary)" }}
            image={CONFIG.SHOW_BACKGROUND ? "/config/images/bg.png" : null}
          >
            <s.Container jc={"center"} ai={"center"} style={{ width: "70%" }}>
              <s.TextTitle
                style={{ textAlign: "left", color: "var(--para-header)" }}
              >
                Roadmap
              </s.TextTitle>
              <VerticalTimeline events={events} interval={5000}/>
            </s.Container>
          </s.Container>

          <s.Container
            flex={1}
            ai={"center"}
            style={{ minWidth: 400,width: '60%', padding: 24, backgroundColor: "var(--primary)" }}
            image={CONFIG.SHOW_BACKGROUND ? "/config/images/bg.png" : null}
          >
            <ResponsiveWrapper flex={1} style={{ padding: 24 }} test>
              <s.SpacerLarge />
              <s.Container
                flex={2}
                jc={"center"}
                ai={"center"}
                style={{
                  backgroundColor: "var(--accent)",
                  padding: 24,
                  borderRadius: 24,
                  border: "4px var(--secondary)",
                  boxShadow: "0px 5px 11px 2px rgba(0,0,0,0.7)",
                }}
              >
                <s.TextTitle
                  style={{
                    textAlign: "center",
                    fontSize: 50,
                    fontWeight: "bold",
                    color: "var(--accent-text)",
                  }}
                >
                  {data.totalSupply} / {CONFIG.MAX_SUPPLY}
                </s.TextTitle>
                <s.TextDescription
                  style={{
                    textAlign: "center",
                    color: "var(--primary-text)",
                  }}
                >
                  <StyledLink target={"_blank"} href={CONFIG.SCAN_LINK}>
                    {truncate(CONFIG.CONTRACT_ADDRESS, 15)}
                  </StyledLink>
                </s.TextDescription>
                <s.SpacerSmall />
                {Number(data.totalSupply) >= CONFIG.MAX_SUPPLY ? (
                  <>
                    <s.TextTitle
                      style={{ textAlign: "center", color: "var(--accent-text)" }}
                    >
                      The sale has ended.
                    </s.TextTitle>
                    <s.TextDescription
                      style={{ textAlign: "center", color: "var(--accent-text)" }}
                    >
                      You can still find {CONFIG.NFT_NAME} on
                    </s.TextDescription>
                    <s.SpacerSmall />
                    <StyledLink target={"_blank"} href={CONFIG.MARKETPLACE_LINK}>
                      {CONFIG.MARKETPLACE}
                    </StyledLink>
                  </>
                ) : (
                  <>
                    <s.TextTitle
                      style={{ textAlign: "center", color: "var(--accent-text)" }}
                    >
                      1 {CONFIG.SYMBOL} costs {CONFIG.DISPLAY_COST}{" "}
                      {CONFIG.NETWORK.SYMBOL}.
                    </s.TextTitle>
                    <s.SpacerXSmall />
                    <s.TextDescription
                      style={{ textAlign: "center", color: "var(--accent-text)" }}
                    >
                      Excluding gas fees.
                    </s.TextDescription>
                    <s.SpacerSmall />
                    {blockchain.account === "" ||
                    blockchain.smartContract === null ? (
                      <s.Container ai={"center"} jc={"center"}>
                        <s.TextDescription
                          style={{
                            textAlign: "center",
                            color: "var(--accent-text)",
                          }}
                        >
                          Connect to the {CONFIG.NETWORK.NAME} network
                        </s.TextDescription>
                        <s.SpacerSmall />
                        <StyledButton
                          onClick={(e) => {
                            e.preventDefault();
                            dispatch(connect());
                            getData();
                          }}
                        >
                          CONNECT
                        </StyledButton>
                        {blockchain.errorMsg !== "" ? (
                          <>
                            <s.SpacerSmall />
                            <s.TextDescription
                              style={{
                                textAlign: "center",
                                color: "var(--accent-text)",
                              }}
                            >
                              {blockchain.errorMsg}
                            </s.TextDescription>
                          </>
                        ) : null}
                      </s.Container>
                    ) : (
                      <>
                        <s.TextDescription
                          style={{
                            textAlign: "center",
                            color: "var(--accent-text)",
                          }}
                        >
                          {feedback}
                        </s.TextDescription>
                        <s.SpacerMedium />
                        <s.Container ai={"center"} jc={"center"} fd={"row"}>
                          <StyledRoundButton
                            style={{ lineHeight: 0.4 }}
                            disabled={claimingNft ? 1 : 0}
                            onClick={(e) => {
                              e.preventDefault();
                              decrementMintAmount();
                            }}
                          >
                            -
                          </StyledRoundButton>
                          <s.SpacerMedium />
                          <s.TextDescription
                            style={{
                              textAlign: "center",
                              color: "var(--accent-text)",
                            }}
                          >
                            {mintAmount}
                          </s.TextDescription>
                          <s.SpacerMedium />
                          <StyledRoundButton
                            disabled={claimingNft ? 1 : 0}
                            onClick={(e) => {
                              e.preventDefault();
                              incrementMintAmount();
                            }}
                          >
                            +
                          </StyledRoundButton>
                        </s.Container>
                        <s.SpacerSmall />
                        <s.Container ai={"center"} jc={"center"} fd={"row"}>
                          <StyledButton
                            disabled={claimingNft ? 1 : 0}
                            onClick={(e) => {
                              e.preventDefault();
                              claimNFTs();
                              getData();
                            }}
                          >
                            {claimingNft ? "BUSY" : "BUY"}
                          </StyledButton>
                        </s.Container>
                      </>
                    )}
                  </>
                )}
                <s.SpacerMedium />
              </s.Container>
              <s.SpacerLarge />
            </ResponsiveWrapper>
          </s.Container>

          <s.Container
            flex={1}
            ai={"center"}
            style={{ minWidth: 400,width: '60%', padding: 24, backgroundColor: "var(--secondary)" }}
            image={CONFIG.SHOW_BACKGROUND ? "/config/images/bg.png" : null}
          >
            <s.Container jc={"center"} ai={"center"} style={{ width: "70%" }}>
              <s.TextDescription
                style={{
                  textAlign: "center",
                  color: "var(--primary-text)",
                }}
              >
                Please make sure you are connected to the right network (
                {CONFIG.NETWORK.NAME} Mainnet) and the correct address. Please note:
                Once you make the purchase, you cannot undo this action.
              </s.TextDescription>
              <s.SpacerSmall />
              <s.TextDescription
                style={{
                  textAlign: "center",
                  color: "var(--primary-text)",
                }}
              >
                We have set the gas limit to {CONFIG.GAS_LIMIT} for the contract to
                successfully mint your NFT. We recommend that you don't lower the
                gas limit.
              </s.TextDescription>
            </s.Container>
          </s.Container>
        </s.Screen>
  );
}

export default App;
