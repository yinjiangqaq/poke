
/////////////////////////////////////////////////
//  梅花  <   方块  <   红桃  < 黑桃
//   1        2        3      4
//
//  0    1    2    3     4    5  。。。。
//梅花1 方块1 红桃1 黑桃1 梅花2 方块2 。。。。
/////////////////////////////////////////////////



import UIKit

//卡牌类
class Card {
    var card_id : Int = 0                   //卡牌ID
    var card_color : String = ""             //卡牌花色
    var card_num : Int = 0                  //卡牌数字
    var card_weight = 0                     //卡牌权值(未施工)
    init(cardId: Int , cardColor: String , cardNum: Int , cardWeight : Int) {
        self.card_id = cardId
        self.card_color = cardColor
        self.card_num = cardNum
        self.card_weight = cardWeight
    }


}


//工具类
class MyTools {
    
    //由卡牌id获得卡牌对象
    class func getCardByID(card_id : Int) -> Card {
        var card_color : String = MyTools.getColorByID(card_id: card_id)
        var card_num : Int = MyTools.getNumByID(card_id: card_id)
        var card_weight : Int = MyTools.getWeightByID(card_id: card_id)
        return Card(cardId : card_id , cardColor : card_color , cardNum : card_num , cardWeight : card_weight)
    }
    
    //由卡牌id获得卡牌数字
    class func getColorByID(card_id : Int) -> String {
        if card_id < 0 || card_id > 51 {
            //大小鬼王（未施工）
            return ""
        }
        else {
            var temp : Int = card_id%4+1
            switch temp {
            case 1:
                return "Club"           //梅花
            case 2:
                return "Diamond"        //方块
            case 3:
                return "Heart"          //红桃
            case 4:
                return "Spade"          //黑桃
            default:
                return ""
            }
        }
    }
    
    //由卡牌id获得卡牌花色
    class func getNumByID(card_id :Int) -> Int {
        if card_id < 0 || card_id > 51 {
            //大小鬼王（未施工）
            return -1
        }
        else {
            return (card_id/4)+1
        }
    }
    
    //由卡牌id获得卡牌权值（未施工）
    class func getWeightByID(card_id : Int) -> Int {
        return 0
    }
    
    //把卡牌数组按权值由小到大顺序排列（未施工）
    class func order(cardList : Array<Card>) {
        
    }
}

//玩家类（暂定，可能有分机器人和人）
class Person {
    var myCardList: Array<Card> = []    //本人有的卡
    
    //初始化（各种姓名之类的信息）（未施工）
    init() {
        
    }
    
    //拿牌（未施工完，暂定拿一张牌）
    func addCard(card : Card) {
        myCardList.append(card)
    }
    
}



class CardBox {
    var cardList: Array<Card> = []  //卡牌数组
    
    //初始化，实例化52张牌并洗牌
    init() {
        for i in 0..<52 {
            cardList.append(MyTools.getCardByID(card_id : i))
        }
        self.shuffleCard()
    }
    
    //洗牌
    func shuffleCard() {
        for _ in 0...100{
            var a : Int = Int(arc4random() % 52 )
            var tempCard : Card = cardList.remove(at: a)
            cardList.append(tempCard)
        }
    }
    
    //发牌
    func dealCards(player : Person , Nums : Int) {
        for i in stride(from: 0, to: Nums, by: 1){
            player.addCard(card: cardList.remove(at: 0))
        }
    }

}



//此处开始测试
var cardBox = CardBox()
var player = Person()

//卡盒内所有的卡（乱序）
for i in stride(from: 0, to: cardBox.cardList.count, by: 1) {
    print("card_id: \(cardBox.cardList[i].card_id)")
    print("card_color: \(cardBox.cardList[i].card_color)")
    print("card_num: \(cardBox.cardList[i].card_num)")
    print("card_weight: \(cardBox.cardList[i].card_weight)")
    print("")
}


//给人发卡
cardBox.dealCards(player: player, Nums: 1)
for i in stride(from: 0, to: player.myCardList.count, by: 1) {
    print("My card id : \(player.myCardList[i].card_id)")
    print("My card color : \(player.myCardList[i].card_color)")
    print("My card num : \(player.myCardList[i].card_num)")
    print("My card weight : \(player.myCardList[i].card_weight)")
    print("")
}




