module Main exposing (..)

import Browser
import Element as E
import Element.Background as EBG
import Element.Border as EB
import Element.Font as EF
import Element.Input as EI
import Element.Region as ER
import Html exposing (Html)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = darkColors
        , update = update
        , view = viewLayout
        }


type Msg
    = MsgChangeColors


update : Msg -> Model -> Model
update _ model =
    if model.primary == darkColors.primary then
        lightColors

    else
        darkColors


darkColors : Model
darkColors =
    { primary = E.rgb255 0xFF 0xAB 0x00
    , primaryLight = E.rgb255 0xFF 0xDD 0x4B
    , primaryDark = E.rgb255 0xC6 0x7C 0x00
    , secondary = E.rgb255 0x3E 0x27 0x23
    , secondaryLight = E.rgb255 0x6A 0x4F 0x4B
    , secondaryDark = E.rgb255 0x1B 0x00 0x00
    , textOnPrimary = E.rgb255 0x00 0x00 0x00
    , textOnSecondary = E.rgb255 0xFF 0xFF 0xFF
    }


lightColors : Model
lightColors =
    { secondary = E.rgb255 0xFF 0xAB 0x00
    , secondaryLight = E.rgb255 0xFF 0xDD 0x4B
    , secondaryDark = E.rgb255 0xC6 0x7C 0x00
    , primary = E.rgb255 0x3E 0x27 0x23
    , primaryLight = E.rgb255 0x6A 0x4F 0x4B
    , primaryDark = E.rgb255 0x1B 0x00 0x00
    , textOnSecondary = E.rgb255 0x00 0x00 0x00
    , textOnPrimary = E.rgb255 0xFF 0xFF 0xFF
    }


fontGreatVibes : E.Attribute msg
fontGreatVibes =
    EF.family [ EF.typeface "GreatVibes" ]


fontTypewriter : E.Attribute msg
fontTypewriter =
    EF.family [ EF.typeface "Typewriter" ]


type alias Model =
    { secondary : E.Color
    , secondaryLight : E.Color
    , secondaryDark : E.Color
    , primary : E.Color
    , primaryLight : E.Color
    , primaryDark : E.Color
    , textOnSecondary : E.Color
    , textOnPrimary : E.Color
    }


viewLayout : Model -> Html Msg
viewLayout model =
    E.layoutWith
        { options =
            [ E.focusStyle
                { backgroundColor = Nothing
                , borderColor = Just model.primaryDark
                , shadow = Nothing
                }
            ]
        }
        [ EBG.color model.secondaryDark
        , E.padding 22
        , EF.color model.textOnSecondary
        ]
        (E.column
            []
            [ buttonChangeColors model
            , viewTitle model
            , viewSubtitle model
            , dogImage
            , viewContent
            ]
        )


viewTitle : Model -> E.Element msg
viewTitle model =
    E.paragraph
        [ EF.bold
        , EF.color model.primary
        , fontGreatVibes
        , EF.size 52
        , ER.heading 1
        ]
        [ E.text "My Dog"
        ]


viewSubtitle : Model -> E.Element msg
viewSubtitle model =
    E.paragraph
        [ EF.color model.primaryLight
        , EF.size 16
        , fontTypewriter
        , E.paddingXY 0 12
        , ER.heading 2
        ]
        [ E.text "A web page for my dog" ]


dogImage : E.Element msg
dogImage =
    E.image
        [ E.width (E.maximum 300 E.fill)
        , E.centerX
        ]
        { src = "dog.png"
        , description = "a picture of my dog"
        }


buttonChangeColors : Model -> E.Element Msg
buttonChangeColors model =
    EI.button
        [ EBG.color model.primaryLight
        , EB.rounded 8
        , EF.color model.secondaryDark
        , E.alignRight
        , E.paddingEach { top = 12, left = 12, right = 12, bottom = 9 }
        , EF.size 16
        , EF.bold
        , E.mouseOver
            [ EBG.color model.primaryDark
            ]
        ]
        { onPress = Just MsgChangeColors
        , label = E.text "Change Colors"
        }


text0 : String
text0 =
    "Akira Takahashi Elm Study 2024/11/04"


text1 : String
text1 =
    "Akira Takahashi Elm Study 2024:11:04 Tiramisu pie danish pudding lemon drops cheesecake chocolate wafer. Marzipan sesame snaps jelly pastry apple pie toffee chocolate bar. Jelly beans pie shortbread caramels tootsie roll toffee. Halvah chocolate marshmallow apple pie chupa chups chocolate bar candy gingerbread. Candy canes sweet cupcake jelly beans candy caramels cotton candy danish. Topping croissant biscuit biscuit sugar plum."


text2 : String
text2 =
    "Marshmallow toffee candy chocolate cake danish gingerbread. Dragée lollipop soufflé carrot cake bear claw gummies. Fruitcake bonbon chocolate bar candy pudding pie soufflé pastry. Powder brownie sugar plum pie cookie dragée lemon drops sugar plum bear claw. Wafer fruitcake pie chocolate croissant. Fruitcake lemon drops ice cream lollipop apple pie caramels gummi bears tiramisu. Icing pudding tart candy gummies croissant lemon drops powder wafer. Sesame snaps cupcake topping toffee cheesecake candy sugar plum jelly."


text3 : String
text3 =
    "Cake danish lollipop jelly jelly-o lemon drops carrot cake macaroon. Soufflé chocolate apple pie chupa chups sweet. Dessert macaroon cupcake cake fruitcake candy canes gummies biscuit. Pie powder gummi bears gummies cookie toffee toffee jujubes carrot cake. Halvah chocolate cake tootsie roll brownie soufflé pie. Croissant dessert soufflé pie danish dragée caramels. Jujubes powder cookie bear claw powder fruitcake bonbon jelly fruitcake. Apple pie chocolate bar halvah toffee oat cake cupcake apple pie danish tiramisu. Pudding tiramisu tootsie roll icing sugar plum dragée gummi bears tootsie roll powder."


paddingTop : Int -> E.Attribute msg
paddingTop sizze =
    E.paddingEach { top = sizze, left = 0, right = 0, bottom = 0 }


viewContent : E.Element msg
viewContent =
    E.column
        [ fontTypewriter
        , EF.size 16
        , paddingTop 20
        , ER.mainContent
        ]
        [ E.paragraph
            [ E.paddingXY 0 20 ]
            [ E.text text0 ]
        , E.paragraph
            [ E.paddingXY 0 20 ]
            [ E.text text2 ]
        , E.paragraph
            [ E.paddingXY 0 20 ]
            [ E.text text2 ]
        , E.paragraph
            [ E.paddingXY 0 20 ]
            [ E.text text3 ]
        ]
