var express = require(`express`);
var cors = require(`cors`);
var sql = require(`mssql`);
var app = express();
app.use(cors());

const selection = "SELECT * FROM personel";

const config = {
	user: "admin",
	password: "admin",
	server: "DESKTOP-0NPPB7V",
	database: "Lab_Db"
};

const DbConnectionString = 'mssql://admin:admin@127.0.0.1:1433/Lab_Db';

app.get("/", function(req, res) {
	sql.connect(DbConnectionString).then(pool => {
		return pool.request()
		.query(selection);
		}).then(result => {
		sql.close();
		res.json({ data: result.recordset });
		}).catch(err => {
			console.dir(err);
			sql.close();
			});
});

app.get('/add', function(req,res) {
	const { Name, sName, workTime} = req.query;
	const insert = `INSERT INTO personel(FirstName, SecondName, WorkTime) VALUES('${Name}', '${sName}', '${workTime}')`;
	sql.connect(DbConnectionString).then(pool => {
		return pool.request()
		.query(insert);
		}).then(result => {
		sql.close();
		res.send("OK");
		}).catch(err => {
			console.dir(err);
			sql.close();
			});
});

app.listen(4000, () =>{
console.log("yes");
})
