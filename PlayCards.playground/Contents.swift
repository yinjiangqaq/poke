
/////////////////////////////////////////////////
//  梅花  <   方块  <   红桃  < 黑桃
//   1        2        3      4
//
//  0    1    2    3     4    5  。。。。
//梅花1 方块1 红桃1 黑桃1 梅花2 方块2 。。。。
// 52 小鬼王 53 大鬼王
// 权值按3最小，JQK12大小鬼王
/////////////////////////////////////////////////



import UIKit

//卡牌类
class Card {
    var card_id : Int = 0                   //卡牌ID
    var card_color : String = ""             //卡牌花色
    var card_num : Int = 0                  //卡牌数字
    var card_weight = 0                     //卡牌权值
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
    
    //由卡牌id获得卡牌花色
    class func getColorByID(card_id : Int) -> String {
        if card_id < 0 || card_id > 53 {
            //错误
            return ""
        }
        else if card_id == 52 {
            //小鬼王
            return "BlackJoker"
        }
        else if card_id == 53 {
            //大鬼王
            return "RedJoker"
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
    
    //由卡牌id获得卡牌数字
    class func getNumByID(card_id :Int) -> Int {
        if card_id < 0 || card_id > 53 {
            //错误
            return -1
        }
        else if card_id == 52 || card_id == 53 {
            //大小鬼王
            return card_id
        }
        else {
            return (card_id/4)+1
        }
    }
    
    //由卡牌id获得卡牌权值
    class func getWeightByID(card_id : Int) -> Int {
        if card_id < 0 || card_id > 53 {
            //错误
            return -1
        }
        else if card_id == 52 || card_id == 53 {
            //大小鬼王
            return card_id
        }
        else if 0 <= card_id && card_id <= 7 {
            //1和2
            return card_id+44
        }
        else {
            return card_id-8
        }
    }
    
    //把卡牌数组按权值由小到大顺序排列
    class func order(cardList : inout Array<Card>) {
        cardList = cardList.sorted {    (a1 , a2) -> Bool in
            return a1.card_weight < a2.card_weight
        }
    }
}

//玩家类（暂定，可能有分机器人和人）
class Person {
    var myCardList: Array<Card> = []    //本人有的卡
    
    //初始化（各种姓名之类的信息）（未施工）
    init() {
        
    }
    
    //拿牌
    func addCard(card : Card) {
        myCardList.append(card)
    }
    
}



class CardBox {
    var cardList: Array<Card> = []  //卡牌数组
    
    //初始化，实例化54张牌并洗牌
    init() {
        for i in 0..<54 {
            cardList.append(MyTools.getCardByID(card_id : i))
        }
        self.shuffleCard()
    }
    
    //洗牌
    func shuffleCard() {
        for _ in 0...100{
            var a : Int = Int(arc4random() % 13 )  //之前的52洗牌率好像有问题，前面很多按顺序的牌
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
cardBox.cardList.forEach{ (c) in
    print("card_id: \(c.card_id)")
    print("card_color: \(c.card_color)")
    print("card_num: \(c.card_num)")
    print("card_weight: \(c.card_weight)")
    print("")
}


//给人发卡
cardBox.dealCards(player: player, Nums: 5)
player.myCardList.forEach{ (c) in
    print("My card id : \(c.card_id)")
    print("My card color : \(c.card_color)")
    print("My card num : \(c.card_num)")
    print("My card weight : \(c.card_weight)")
    print("")
}

//我的卡排序后
MyTools.order(cardList: &player.myCardList)
print("排序后")
player.myCardList.forEach{ (c) in
    print("My card id : \(c.card_id)")
    print("My card color : \(c.card_color)")
    print("My card num : \(c.card_num)")
    print("My card weight : \(c.card_weight)")
    print("")
}



