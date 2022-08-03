//
//  FlagsDao.swift
//  BayrakBul
//
//  Created by Burak AÇIK on 3.08.2022.
//

import Foundation

class FlagsDao {
    
    let db:FMDatabase?
    
    init () {
        let target = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: target).appendingPathComponent("FlagsDataBase.db")
        db = FMDatabase(path: databaseURL.path)
    }
    
    //fetch 9 correct answers
    func random9Questions() -> [Flags] {
        var list = [Flags]()
        
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Flags ORDER BY RANDOM() LIMIT 9", values: nil)
            while(rs.next()) {
                let flag = Flags (flag_id: Int(rs.string(forColumnIndex: 0))!, flag_name: String(rs.string(forColumnIndex: 1)), flag_image: String(rs.string(forColumnIndex: 2)))
                list.append(flag)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
        return list
    }
    
    //fetch 3 wrong answers
    func random3WrongAnswers(flag_id:Int) -> [Flags] {
        var list = [Flags]()
        
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM Flags WHERE flag_id != ? ORDER BY RANDOM() LIMIT 3", values: nil)
            while(rs.next()) {
                let flag = Flags (flag_id: Int(rs.string(forColumnIndex: 0))!, flag_name: String(rs.string(forColumnIndex: 1)), flag_image: String(rs.string(forColumnIndex: 2)))
                list.append(flag)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
        return list
    }
    
    
}


