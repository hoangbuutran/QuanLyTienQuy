package vn.toancauxanh.gg.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.validator.internal.util.privilegedactions.NewInstance;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.sys.ValidationMessages;
import org.zkoss.bind.validator.AbstractValidator;
import org.zkoss.image.AImage;
import org.zkoss.image.Image;
import org.zkoss.io.Files;
import org.zkoss.util.media.Media;
import org.zkoss.util.resource.Labels;
import org.zkoss.zul.Window;

import vn.toancauxanh.model.Model;
import vn.toancauxanh.service.SendEmail;

/**
 * @author PC
 *
 */
@Entity
@Table(name = "car")
public class Car extends Model<Car> {
	public static transient final Logger LOG = LogManager.getLogger(Image.class.getName());

	private String title = "";
	private String name = "";
	private String nameImage = "";
	private String description = "";
	private String carUrl = "";
	private long viewCount;
	private long soLuong;
	private Image avatarImage;
	private boolean newTab;
	private double cost;
	private Date publishBeginTime;
	private Date publishEndTime;
	private DonViHanhChinh thanhPho;
	private DonViHanhChinh quan;
	private DonViHanhChinh phuong;
	
	@ManyToOne
	public DonViHanhChinh getThanhPho() {
		return thanhPho;
	}

	public void setThanhPho(DonViHanhChinh thanhPho) {
		this.thanhPho = thanhPho;
	}
	@ManyToOne
	public DonViHanhChinh getQuan() {
		return quan;
	}

	public void setQuan(DonViHanhChinh quan) {
		this.quan = quan;
	}
	@ManyToOne
	public DonViHanhChinh getPhuong() {
		return phuong;
	}

	public void setPhuong(DonViHanhChinh phuong) {
		this.phuong = phuong;
	}

	public String getNameImage() {
		return nameImage;
	}

	public void setNameImage(String nameImage) {

		this.nameImage = nameImage;
	}

	public long getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(long soLuong) {
		this.soLuong = soLuong;
	}

	@Column(length = 255)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(length = 255)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(length = 255)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCarUrl() {
		return carUrl;
	}

	public void setCarUrl(String carUrl) {
		this.carUrl = carUrl;
	}

	public long getViewCount() {
		return viewCount;
	}

	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}

	public boolean isNewTab() {
		return newTab;
	}

	public void setNewTab(boolean newTab) {
		this.newTab = newTab;
	}

	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}

	public Date getPublishBeginTime() {
		return publishBeginTime;
	}

	public void setPublishBeginTime(Date publishBeginTime) {
		this.publishBeginTime = publishBeginTime;
	}

	public Date getPublishEndTime() {
		return publishEndTime;
	}

	public void setPublishEndTime(Date publishEndTime) {
		this.publishEndTime = publishEndTime;
	}

	private boolean flagImage = true;

	@Transient
	public boolean isFlagImage() {
		return flagImage;
	}

	public void setFlagImage(boolean _flagImage) {
		this.flagImage = _flagImage;
	}

	@Transient
	public org.zkoss.image.Image getAvatarImage() {

		if (avatarImage == null && !noId() && !core().TT_DA_XOA.equals(getTrangThai())) {
			if (flagImage) {
				try {
					loadImageIsView();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return avatarImage;
	}

	private void loadImageIsView() throws FileNotFoundException, IOException {
		String imgName = "";
		String path = "";
		path = folderStore() + getNameImage();
		if (!"".equals(getCarUrl()) && new File(path).exists()) {
			try (FileInputStream fis = new FileInputStream(new File(path));) {
				setAvatarImage(new AImage(imgName, fis));
			}
		}
	}

	public void setAvatarImage(Image avatarImage) {
		this.avatarImage = avatarImage;
	}

	@Command
	public void attachImages(@BindingParam("media") final Media media,
			@BindingParam("vmsgs") final ValidationMessages vmsgs) {
		LOG.info("attachImages");
		if (media instanceof org.zkoss.image.Image) {
			if (media.getName().toLowerCase().endsWith(".png") || media.getName().toLowerCase().endsWith(".jpg")) {
				int lengthOfImage = media.getByteData().length;
				if (lengthOfImage > 10000000) {
					showNotification("Chọn hình ảnh có dung lượng nhỏ hơn 10MB.", "", "error");
					return;
				} else {
					String tenFile = media.getName();
					tenFile = tenFile.replace(" ", "");
					tenFile = tenFile.substring(0, tenFile.lastIndexOf(".")) + "_"
							+ Calendar.getInstance().getTimeInMillis() + tenFile.substring(tenFile.lastIndexOf("."));
					setAvatarImage((org.zkoss.image.Image) media);
					setNameImage(tenFile);
					if (vmsgs != null) {
						vmsgs.clearKeyMessages("errLabel");
					}
					BindUtils.postNotifyChange(null, null, this, "avatarImage");
					BindUtils.postNotifyChange(null, null, this, "nameImage");
				}
			} else {
				showNotification("Chọn hình ảnh theo đúng định dạng (*.png, *.jpg)", "", "error");
			}
		} else {
			showNotification("File tải lên không phải hình ảnh!", "", "error");
		}
	}

	@Command
	public void saveCar(@BindingParam("list") final Object listObject, @BindingParam("attr") final String attr,
			@BindingParam("wdn") final Window wdn) throws IOException {
		LOG.info("save image");
		if (beforeSaveImg()) {
			save();
			wdn.detach();
			BindUtils.postNotifyChange(null, null, listObject, attr);
			SendEmail.sendEmailGmail("tranhoangbuu66@gmail.com", "hihi", "<h1>hihihi</h1>");
		} else {
			showNotification("Bạn chưa chọn hình ảnh", "", "error");
		}
	}

	private boolean beforeSaveImg() throws IOException {
		if (getAvatarImage() == null) {
			return false;
		}
		saveImageToServer();
		return true;
	}

	protected void saveImageToServer() throws IOException {

		Image avatarImage2 = getAvatarImage();
		if (avatarImage2 != null) {
			// luu hinh
			LOG.info("saveImage() :" + folderStore() + getNameImage());

			setCarUrl(folderCarUrl().concat(getNameImage()));// lưu đường dẫn hình ảnh
			final File baseDir = new File(folderStore().concat(getNameImage()));
			Files.copy(baseDir, avatarImage2.getStreamData());
		}
	}

	@Transient
	public String folderCarUrl() {
		return "/" + Labels.getLabel("filestore.folder") + "/car/";
	}

	@Command
	public void deleteImg() {
		LOG.info("deleteImg--");
		setAvatarImage(null);
		setNameImage("");
		flagImage = false;
		BindUtils.postNotifyChange(null, null, this, "avatarImage");
		BindUtils.postNotifyChange(null, null, this, "name");
	}

	@Transient
	public AbstractValidator getValidatorCar() {
		return new AbstractValidator() {
			@Override
			public void validate(final ValidationContext ctx) {
				if (!getTitle().startsWith("CX-") && !getTitle().equals("")) {
					addInvalidMessage(ctx, "nameCarErr", "Tên phải bắt đầu bằng \"CX-\"");
				}
				
				if (getAvatarImage() == null) {
					addInvalidMessage(ctx, "error", "Bạn chưa chọn hình ảnh cho xe.");
				}
				
				Date fromDate = getPublishBeginTime();
				Date toDate = getPublishEndTime();
				if (fromDate != null && toDate != null) {
					if (fromDate.compareTo(toDate) > 0) {
						addInvalidMessage(ctx, "lblErr", "Ngày hết hạn phải lớn hơn hoặc bằng ngày xuất bản.");
					}
				}

				if (getSoLuong() > 100) {
					addInvalidMessage(ctx, "soLuongErr", "Số lượng phải bé hơn 100");
				} else if (getSoLuong() < 10) {
					addInvalidMessage(ctx, "soLuongErr", "Số lượng lớn hơn 10");
				}

			}
		};
	}
}
