import Foundation
import SQLite3


final class SqliteWrapper{
    private enum SQLiteOperation : String{
        case CREATE
        case UPDATE
        case DELETE
        case SELECT
        case INSERT
        case DROP
    }
    
    private let dbReference : OpaquePointer?
    
    init(for datbaseName: String){
        dbReference = SqliteWrapper.getDatabase(databaseName: datbaseName)
    }
    
    private static func getDatabase(databaseName : String) ->  OpaquePointer?{
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(databaseName)
        
//        print(filePath)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(filePath.path, &db) != SQLITE_OK
        {
            debugPrint("can't open database")
            return nil
        }
        
        return db
    }
    
    func create(tabel tableName : String,values fieldDetails : [FieldDetail],primaryKeys : [String]?){
        
        dropTable(table: tableName)
        
        var queryString = "CREATE TABLE IF NOT EXISTS \(tableName)("
        
        for fieldDetail in fieldDetails {
            queryString += fieldDetail.fieldName + " "
            queryString += fieldDetail.fieldType.rawValue + " "
            
            if fieldDetail.isUnique{
                queryString += "UNIQUE "
            }
            
            if fieldDetail.isNotNull{
                queryString += "NOT NULL "
            }
            
            if let defaultValue = fieldDetail.defaultValue{
                queryString += " DEFAULT "
                queryString += fieldDetail.fieldType == .TEXT ? "'" : ""
                queryString += defaultValue
                queryString += fieldDetail.fieldType == .TEXT ? "'" : ""
            }
            
            queryString += ", "
        }
        
        if let primaryKeys = primaryKeys{
            queryString += "PRIMARY KEY ("
            for primaryKeyIndex in 0 ..< primaryKeys.count {
                queryString += primaryKeys[primaryKeyIndex]
                queryString += primaryKeyIndex == primaryKeys.count - 1 ? ") " : ", "
            }
        }
        
        queryString += ");"
        
        executeStament(queryString: queryString, tableName: tableName, operation: .CREATE)
    }
    
    func insert(into tableName : String,values fieldDetails : [FieldWithValue<String>]){
        
        var queryString = "INSERT INTO \(tableName)( "
        
        
        for fieldDetailIndex in 0 ..< fieldDetails.count{
            queryString += fieldDetails[fieldDetailIndex].fieldName
            
            queryString += fieldDetailIndex == fieldDetails.count-1 ? " ) " : ","
        }
        
        queryString += "VALUES (\(String(repeating: "?,", count: fieldDetails.count-1))?);"
                
        var insertStatement: OpaquePointer? = nil
        
        let prepareResult = sqlite3_prepare_v2(dbReference, queryString, -1, &insertStatement, nil)
        
        if prepareResult != SQLITE_OK{
            print("INSERT statement could not be prepared.")
            return
        }
        
        for fieldDetailIndex in 0 ..< fieldDetails.count {
            switch fieldDetails[fieldDetailIndex].fieldType{
                case .TEXT:
                    let fieldDetail = fieldDetails[fieldDetailIndex].fieldValue
                
                    sqlite3_bind_text(insertStatement, Int32(fieldDetailIndex+1), (fieldDetail as NSString).utf8String, -1, nil)
                
                case .INTEGER:
                
                    if let
                        fieldDetail = Int32(fieldDetails[fieldDetailIndex].fieldValue) {
                        
                        sqlite3_bind_int(insertStatement, Int32(fieldDetailIndex+1), fieldDetail)
                    }
                case .REAL:
                    if let fieldDetail = Double(fieldDetails[fieldDetailIndex].fieldValue){
                        
                        sqlite3_bind_double(insertStatement, Int32(fieldDetailIndex+1), fieldDetail)
                    }
            }
           
        }
        
        let result = sqlite3_step(insertStatement)
            
        if result != SQLITE_DONE{
            print("Could not insert a row : stmt[ \(queryString) ]")
        }
                    
        sqlite3_finalize(insertStatement)
    }
        
    
    func update(into tableName : String,set fieldDetails : [FieldWithValue<String>],where conditions : [QueryCondition]?){
        
        var queryString = "UPDATE \(tableName) SET "
        
        for fieldDetailIndex in 0 ..< fieldDetails.count {
            let fieldDetail = fieldDetails[fieldDetailIndex]
            queryString += fieldDetail.fieldName
            queryString += " = "
            queryString += fieldDetail.fieldType == .TEXT ? "'" : ""
            queryString += fieldDetail.fieldValue
            queryString += fieldDetail.fieldType == .TEXT ? "'" : ""
            queryString += fieldDetailIndex == fieldDetails.count-1 ? " " : ", "
        }
        
        if let conditions = conditions{
            queryString += "WHERE "
            
            for conditionIndex in 0 ..< conditions.count {
                let condition = conditions[conditionIndex]
                queryString += condition.lhs + " "
                queryString += condition.condition.rawValue+" "
                queryString += condition.rhsType == .TEXT ? "'" : ""
                queryString += condition.rhs
                queryString += condition.rhsType == .TEXT ? "'" : ""
                
                queryString += conditionIndex == conditions.count-1 ? " " : " AND "            }
        }
        queryString += ";"
                
        executeStament(queryString: queryString, tableName: tableName, operation: .UPDATE)
    }
    
    func delete(into tableName : String,where conditions : [QueryCondition]?){
        
        var queryString = "DELETE FROM \(tableName) "
        

        if let conditions = conditions{
            queryString += "WHERE "
            
            for conditionIndex in 0 ..< conditions.count {
                let condition = conditions[conditionIndex]
                queryString += condition.lhs + " "
                queryString += condition.condition.rawValue+" "
                queryString += condition.rhsType == .TEXT ? "'" : ""
                queryString += condition.rhs
                queryString += condition.rhsType == .TEXT ? "'" : ""
                
                queryString += conditionIndex == conditions.count-1 ? " " : " AND "            }
        }
        queryString += ";"
        
        print(queryString)
        
        executeStament(queryString: queryString, tableName: tableName, operation: .DELETE)
    }
    
    func dropTable(table tableName : String){
        
        let queryString = "DROP TABLE \(tableName)"
        
        executeStament(queryString: queryString, tableName: tableName, operation: .DELETE)
    }
    
    private func executeStament(queryString : String,tableName : String,operation : SQLiteOperation){
        
        var tableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(dbReference, queryString, -1, &tableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(tableStatement) != SQLITE_DONE
            {
                let errmsg = String(cString: sqlite3_errmsg(dbReference)!)
                print("\(tableName) Table could not be \(operation.rawValue)\nError Message: \(errmsg)")
            }
            
        }else {
            let errmsg = String(cString: sqlite3_errmsg(dbReference)!)
            print("\(operation.rawValue) TABLE statement for \(tableName) could not be prepared.\nError Message: \(errmsg)")
        }
        sqlite3_finalize(tableStatement)
    }
    
    
    func select(fields : [String]?,from tableName : String,where conditions : [QueryCondition]?) -> [[FieldWithValue<Any>]]{
        var result : [[FieldWithValue<Any>]] = []
        var queryString = "SELECT "
        if let fields = fields{
            for fieldIndex in 0 ..< fields.count {
                let field = fields[fieldIndex]
                queryString += field
                queryString += fieldIndex == fields.count-1 ? " " : ", "
            }
        }else{
            queryString += " * "
        }
        
        queryString += "FROM \(tableName) "
        
        if let conditions = conditions{
            queryString += "WHERE "
            
            for conditionIndex in 0 ..< conditions.count {
                let condition = conditions[conditionIndex]
                queryString += condition.lhs + " "
                queryString += condition.condition.rawValue+" "
                queryString += condition.rhsType == .TEXT ? "'" : ""
                queryString += condition.rhs
                queryString += condition.rhsType == .TEXT ? "'" : ""
                
                queryString += conditionIndex == conditions.count-1 ? " " : " AND "            }
        }
                
        var tableStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(dbReference, queryString, -1, &tableStatement, nil) == SQLITE_OK
        {
            //Selecting from DB
            
            while sqlite3_step(tableStatement) == SQLITE_ROW {
                
                let columnCount = sqlite3_column_count(tableStatement)
                
                var qurriedRow : [FieldWithValue<Any>] = []
                for rowIndex in 0 ..< columnCount{
        
                    if let row = getFieldValue(
                        tableStatement: tableStatement,
                        rowIndex: Int(rowIndex)){
                        qurriedRow.append(row)
                    }
                                
                }
                result.append(qurriedRow)
            }
            
            
        }else {
            let errmsg = String(cString: sqlite3_errmsg(dbReference)!)
            print("\(SQLiteOperation.SELECT) TABLE statement for \(tableName) could not be prepared.\nError Message: \(errmsg)")
        }
        sqlite3_finalize(tableStatement)
    
        return result
    }
    
    private func getFieldValue(tableStatement : OpaquePointer?, rowIndex : Int) -> FieldWithValue<Any>?{
        
        guard let fieldName = sqlite3_column_name(tableStatement, Int32(rowIndex)) else {
            return nil
        }
        
        switch sqlite3_column_type(tableStatement, Int32(rowIndex)) {
            
        case SQLITE_INTEGER:
            let fieldValue = sqlite3_column_int(tableStatement, Int32(rowIndex))
                
            return FieldWithValue(
                    fieldName: String(cString: fieldName),
                    fieldType: .INTEGER,
                    fieldValue: Int(fieldValue)
                )

        case SQLITE_FLOAT:
            let fieldValue =
                        sqlite3_column_double(tableStatement, Int32(rowIndex))
            return FieldWithValue(
                        fieldName: String(cString: fieldName),
                        fieldType: .REAL,
                        fieldValue: fieldValue
                    )
                            
        case SQLITE_TEXT:
            let fieldValue = sqlite3_column_text(tableStatement, Int32(rowIndex))
           
            return FieldWithValue(
                            fieldName: String(cString: fieldName),
                            fieldType: .TEXT,
                            fieldValue: String(cString: fieldValue!)
                        )
        default:
            return nil
        }
    }
}
