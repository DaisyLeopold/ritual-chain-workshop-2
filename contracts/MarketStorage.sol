// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract MarketStorage {



    uint256 public marketCounter;




    struct Market {


        uint256 id;


        string question;


        uint256 deadline;


        bool resolved;


        bool outcome;



    }




    mapping(

        uint256 => Market

    )

    internal markets;






    event MarketStored(

        uint256 indexed id,

        string question

    );








    function createStorageMarket(

        string memory question,

        uint256 deadline

    )

    internal

    returns(

        uint256

    )

    {



        marketCounter++;




        markets[marketCounter]

        = Market({

            id:marketCounter,

            question:question,

            deadline:deadline,

            resolved:false,

            outcome:false

        });





        emit MarketStored(

            marketCounter,

            question

        );




        return marketCounter;


    }







    function readMarket(

        uint256 id

    )

    internal

    view

    returns(

        Market memory

    )

    {


        return markets[id];


    }






}
