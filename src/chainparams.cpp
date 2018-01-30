// Copyright (c) 2010 Satoshi Nakamoto
// Copyright (c) 2009-2012 The Bitcoin developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include "assert.h"

#include "chainparams.h"
#include "main.h"
#include "util.h"
#include "checkpoints.h"

#include <boost/assign/list_of.hpp>

using namespace boost::assign;

struct SeedSpec6 {
    uint8_t addr[16];
    uint16_t port;
};

#include "chainparamsseeds.h"
//
// Main network
//

// Convert the pnSeeds6 array into usable address objects.
static void convertSeed6(std::vector<CAddress> &vSeedsOut, const SeedSpec6 *data, unsigned int count)
{
    // It'll only connect to one or two seed nodes because once it connects,
    // it'll get a pile of addresses with newer timestamps.
    // Seed nodes are given a random 'last seen time' of between one and two
    // weeks ago.
    const int64_t nOneWeek = 7 * 24 * 60 * 60;
    for (unsigned int i = 0; i < count; i++)
    {
        struct in6_addr ip;
        memcpy(&ip, data[i].addr, sizeof(ip));
        CAddress addr(CService(ip, data[i].port));
        addr.nTime = GetTime() - GetRand(nOneWeek) - nOneWeek;
        vSeedsOut.push_back(addr);
    }
}

class CMainParams : public CChainParams {
public:
    CMainParams() {
        // The message start string is designed to be unlikely to occur in normal data.
        // The characters are rarely used upper ASCII, not valid as UTF-8, and produce
        // a large 4-byte int at any alignment.
        pchMessageStart[0] = 0xa7;
        pchMessageStart[1] = 0x3f;
        pchMessageStart[2] = 0x23;
        pchMessageStart[3] = 0xc1;
        vAlertPubKey = ParseHex("04b053cd9f161528241bcf3bd55023679be17f0ba9a2894ad5eb9fd13c016ed9a2f222989769417ed3a16e6fbebbbd551be1a4bd2d10cdb679228c91e26e26900e");
        nDefaultPort = 16752;
        nRPCPort = 16751;
        bnProofOfWorkLimit = CBigNum(~uint256(0) >> 16);
		
        const char* pszTimestamp = "http://www.bbc.co.uk/news/technology-42853072"; // Fitness app Strava lights up staff at military bases
        std::vector<CTxIn> vin;
        vin.resize(1);
        vin[0].scriptSig = CScript() << 4867295 << CBigNum(42) << vector<unsigned char>((const unsigned char*)pszTimestamp, (const unsigned char*)pszTimestamp + strlen(pszTimestamp));
        std::vector<CTxOut> vout;
        vout.resize(1);
        vout[0].SetEmpty();
        CTransaction txNew(1, 1517246580, vin, vout, 0);
        genesis.vtx.push_back(txNew);
        genesis.hashPrevBlock = 0;
        genesis.hashMerkleRoot = genesis.BuildMerkleTree();
        genesis.nVersion = 1;
        genesis.nTime    = 1517246580;
        genesis.nBits    = 0x1f00ffff; 
        genesis.nNonce   = 527869;

        hashGenesisBlock = genesis.GetHash();

        assert(hashGenesisBlock == uint256("0xfc5b7a0846038dc7445e981f35de039967c9e660aa809f05b69fbdbaaf51e674"));
        assert(genesis.hashMerkleRoot == uint256("0xecf574b836a7da7dec7e5932d83dc607fbd87a0c655782927ab9c788fe9d3bbf"));

        
        base58Prefixes[PUBKEY_ADDRESS] = list_of(25);
        base58Prefixes[SCRIPT_ADDRESS] = list_of(84);
        base58Prefixes[SECRET_KEY] =     list_of(92);
        base58Prefixes[EXT_PUBLIC_KEY] = list_of(0x04)(0x44)(0xF7)(0x3D);
        base58Prefixes[EXT_SECRET_KEY] = list_of(0x04)(0x44)(0xA2)(0x4B);

        convertSeed6(vFixedSeeds, pnSeed6_main, ARRAYLEN(pnSeed6_main));

        nPOSStartBlock = 1;
    }

    virtual const CBlock& GenesisBlock() const { return genesis; }
    virtual Network NetworkID() const { return CChainParams::MAIN; }

    virtual const vector<CAddress>& FixedSeeds() const {
        return vFixedSeeds;
    }
protected:
    CBlock genesis;
    vector<CAddress> vFixedSeeds;
};
static CMainParams mainParams;


//
// Testnet
//

class CTestNetParams : public CMainParams {
public:
    CTestNetParams() {
        // The message start string is designed to be unlikely to occur in normal data.
        // The characters are rarely used upper ASCII, not valid as UTF-8, and produce
        // a large 4-byte int at any alignment.
        pchMessageStart[0] = 0x3a;
        pchMessageStart[1] = 0x7f;
        pchMessageStart[2] = 0x9e;
        pchMessageStart[3] = 0xfc;
        bnProofOfWorkLimit = CBigNum(~uint256(0) >> 16);
        vAlertPubKey = ParseHex("04b053cd9f161528241bcf3bd55023679be17f0ba9a2894ad5eb9fd13c016ed9a2f222989769417ed3a16e6fbebbbd551be1a4bd2d10cdb679228c91e26e26900e");
        nDefaultPort = 26752;
        nRPCPort = 26751;
        strDataDir = "testnet";

        // Modify the testnet genesis block so the timestamp is valid for a later start.
        genesis.nBits  = 51219271; 
        genesis.nNonce = 91643;

        //assert(hashGenesisBlock == uint256(""));

        vFixedSeeds.clear();
        vSeeds.clear();

        base58Prefixes[PUBKEY_ADDRESS] = list_of(33);
        base58Prefixes[SCRIPT_ADDRESS] = list_of(97);
        base58Prefixes[SECRET_KEY]     = list_of(99);
        base58Prefixes[EXT_PUBLIC_KEY] = list_of(0x05)(0x88)(0x6C)(0x9E);
        base58Prefixes[EXT_SECRET_KEY] = list_of(0x05)(0x88)(0xA1)(0x2F);

        convertSeed6(vFixedSeeds, pnSeed6_test, ARRAYLEN(pnSeed6_test));

        nPOSStartBlock = 1;

    }
    virtual Network NetworkID() const { return CChainParams::TESTNET; }
};
static CTestNetParams testNetParams;


static CChainParams *pCurrentParams = &mainParams;

const CChainParams &Params() {
    return *pCurrentParams;
}

void SelectParams(CChainParams::Network network) {
    switch (network) {
        case CChainParams::MAIN:
            pCurrentParams = &mainParams;
            break;
        case CChainParams::TESTNET:
            pCurrentParams = &testNetParams;
            break;
        default:
            assert(false && "Unimplemented network");
            return;
    }
}

bool SelectParamsFromCommandLine() {
    
    bool fTestNet = GetBoolArg("-testnet", false);
    
    if (fTestNet) {
        SelectParams(CChainParams::TESTNET);
    } else {
        SelectParams(CChainParams::MAIN);
    }
    return true;
}
