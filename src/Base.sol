// SPDX-License-Identifier: MIT
pragma solidity >=1.1.0;

import {StdStorage} from "./StdStorage.sol";
import {Vm, VmSafe} from "./Vm.sol";

abstract contract CommonBase {
    // Cheat code address, 0xcb69fc06a12b7a6f30e2a3c16a3b5d502cd71c20f2f8.
    address internal constant VM_ADDRESS = address(0xcb69fc06a12b7a6f30e2a3c16a3b5d502cd71c20f2f8);
    // console.sol and console2.sol work by executing a staticcall to this address.
    address internal constant CONSOLE = 0xcb82000000000000000000636f6e736f6c652e6c6f67;
    // Used when deploying with create2, https://github.com/Arachnid/deterministic-deployment-proxy.
    address internal constant CREATE2_FACTORY = 0xcb914e59b44847b379578588920ca78fbf26c0b4956c;
    // Default address for tx.origin and msg.sender, 0x1804c8AB1F12E6bbf3894d4083f33e07309d1f38.
    address internal constant DEFAULT_SENDER = address(0xcb681804c8ab1f12e6bbf3894d4083f33e07309d1f38);
    // Address of the test contract, deployed by the DEFAULT_SENDER.
    address internal constant DEFAULT_TEST_CONTRACT = 0xcb785615deb798bb3e4dfa0139dfa1b3d433cc23b72f;
    // Deterministic deployment address of the Multicall3 contract.
    address internal constant MULTICALL3_ADDRESS = 0xcb11ca11bde05977b3631167028862be2a173976ca11;
    // The order of the secp256k1 curve.
    uint256 internal constant SECP256K1_ORDER =
        115792089237316195423570985008687907852837564279074904382605163141518161494337;

    uint256 internal constant UINT256_MAX =
        115792089237316195423570985008687907853269984665640564039457584007913129639935;

    Vm internal constant vm = Vm(VM_ADDRESS);
    StdStorage internal stdstore;
}

abstract contract TestBase is CommonBase {}

abstract contract ScriptBase is CommonBase {
    VmSafe internal constant vmSafe = VmSafe(VM_ADDRESS);
}
