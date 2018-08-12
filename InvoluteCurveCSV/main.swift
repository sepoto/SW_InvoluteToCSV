import Foundation

var a = 1.0;
var x1 = -5.0;
var x2 = 5.0;
var scsv = "";

for t in stride(from: x1, through: x2, by: 0.1)
{
    var px=Double(0);
    var py=Double(0);
    px = Double(a*(cos(t)+t*sin(t)));
    py = Double(a*(sin(t)-t*cos(t)));
    let line = String(t) + "," + String(px)+","+String(py)+"\n";
    scsv.append(line);
}

let file = "involute_points.csv";

if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    
    let fileURL = dir.appendingPathComponent(file);
    
    do {
        try scsv.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8);
    } catch {
        print("Failed to create file")
        print("\(error)")
    }
}
