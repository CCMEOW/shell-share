//
//  PersonalSpaceViewController.swift
//  shell
//
//  Created by Shelro on 2017/4/29.
//  Copyright © 2017年 orient. All rights reserved.
//

import UIKit

class PersonalSpaceViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //屏幕的宽和高
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    let songData = ["A Cup of Coffee", "Summer Vibe", "Coffee Kiss", "I do Adore", "Zou Bisou, Bisou", "Ash Cloud", "Cut Dick", "Rock n'roll", "Lullaby","Successlessness","You Ain't the first","Waiting on the World to Change"]
    let songSinger = ["Julian Moon", "Walk off the Earth", "Shane Alexander", "Mindy Glendhill", "Jessica Pera", "Brazzaville", "Mr.Oizo", "The Sounds", "Morrie","The Lucksmiths","Gun N'Rose","John Mayer"]
    
    var conch_num = 12
    var following_num = 20
    var follower_num = 27

    @IBOutlet weak var conchNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
    @IBOutlet weak var followerNum: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBAction func lookFollowing(_ sender: Any) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "followingList"))!
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    @IBAction func lookFollower(_ sender: Any) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "followerList"))!
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    @IBAction func lookCollection(_ sender: Any) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "collectionList"))!
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    @IBAction func lookLikeList(_ sender: Any) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "likeList"))!
        navigationController?.pushViewController(anotherView, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //初始化数据
        conchNum.text = String(conch_num)
        followingNum.text = String(following_num)
        followerNum.text = String(follower_num)
        
        
        loadCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCollectionView(){
        //定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: 109, height: 127)
        //滑动方向 默认方向是垂直
        layout.scrollDirection = .vertical
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 0
        //每行之间最小的间距
        layout.minimumLineSpacing = 0
        //定义一个UICollectionView
        //let collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: width,height: height), collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        //设置collectionView的代理和数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //CollectionViewCell的注册
        
        collectionView.backgroundColor = UIColor.white
       
        collectionView.register(UINib(nibName: "PersonalConchCell", bundle: nil), forCellWithReuseIdentifier: "ConchCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     - returns: Section中Item的个数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songData.count
    }
    
    /**
     - returns: 绘制collectionView的cell
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ConchCell", for: indexPath) as! PersonalConchCell
        
        cell.songName.text = songData[indexPath.row]
        cell.singerName.text = songSinger[indexPath.row]
        
        return cell
    }
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
     Description:当点击某个Item之后的回应
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let myStoryBoard = self.storyboard
        var anotherView = UIViewController()
        anotherView = (myStoryBoard?.instantiateViewController(withIdentifier: "conchDetail"))!
        self.present(anotherView, animated: true, completion: nil)
    }

}


