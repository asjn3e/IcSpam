import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import icrcTypes "icrc1Types";

// Token canister(ICRC2) types

actor Minter {
    type ICRCTransferError = icrcTypes.ICRCTransferError;
    type ICRCTokenTxReceipt = icrcTypes.ICRCTokenTxReceipt;
    type ICRCMetaDataValue = icrcTypes.ICRCMetaDataValue;
    type ICRCAccount = icrcTypes.ICRCAccount;
    type Subaccount = icrcTypes.Subaccount;
    type ICRC2TransferArg = icrcTypes.ICRC2TransferArg;
    type ICRCTransferArg = icrcTypes.ICRCTransferArg;
    type ICRC2TokenActor = icrcTypes.ICRC2TokenActor;
    type ICRC2AllowanceArgs = icrcTypes.ICRC2AllowanceArgs;
    type ICRC2Allowance = icrcTypes.ICRC2Allowance;

    public shared func mint(principal : Principal) : async ICRCTokenTxReceipt {
        let transferFromArgs : ICRCTransferArg = {
            from_subaccount = null;
            to : ICRCAccount = {
                owner = principal;
                subaccount = null;
            };
            amount : Nat = 1000000000;
        };
        let ledger : ICRC2TokenActor = icrcTypes._getTokenActor(Principal.fromText("aphhe-eaaaa-aaaal-qi74q-cai")); //Buy token actor token actor
        let result = await ledger.icrc1_transfer(transferFromArgs);
        return (result);
    };
};
