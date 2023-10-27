package BLL;

import java.sql.SQLException;
import java.util.ArrayList;

import DAL.LoaiHangDAL;
import DTO.LoaiHang;

public class LoaiHangBLL {
	public ArrayList<LoaiHang> getLoaiHang() throws SQLException {
		LoaiHangDAL lhd = new LoaiHangDAL();
		ArrayList<LoaiHang> arr = new ArrayList<LoaiHang>();
		arr = lhd.docLoaiHang();
		return arr;
	}
	public String getTenLoaiHang(String value) throws SQLException {
		LoaiHangDAL lhd = new LoaiHangDAL();
		return lhd.docLoaiHangMaLH(value);
	}
	public int getLastMaLH() throws SQLException {
		LoaiHangDAL lhd = new LoaiHangDAL();
		return lhd.getLastMaLH();
	}
	public boolean BtnLoaiHang(LoaiHang lh, String condition) throws SQLException {
		LoaiHangDAL lhd = new LoaiHangDAL();
		return lhd.BtnLoaiHang(lh, condition);
	}
}