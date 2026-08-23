// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;



library MarketErrors {



    error InvalidQuestion();


    error InvalidDeadline();


    error MarketNotFound();


    error Unauthorized();


    error MarketFinished();


    error InvalidValue();






    function checkQuestion(

        string memory question

    )

    internal

    pure

    {


        if(

            bytes(question).length == 0

        )

        {

            revert InvalidQuestion();

        }


    }








    function checkValue(

        uint256 value

    )

    internal

    pure

    {


        if(

            value == 0

        )

        {

            revert InvalidValue();

        }


    }





    function checkDeadline(

        uint256 deadline

    )

    internal

    view

    {


        if(

            deadline <= block.timestamp

        )

        {

            revert InvalidDeadline();

        }


    }



}
