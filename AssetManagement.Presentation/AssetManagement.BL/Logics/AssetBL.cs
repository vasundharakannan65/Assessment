using AssetManagement.BL.ViewModels;
using AssetManagement.DA.Data;
using AssetManagement.DA.DataObject;
using AssetManagement.DA.IRepository;
using AssetManagement.DA.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetManagement.BL.Logics
{
    public class AssetBL
    {
        private readonly IAssetRepository _assetRepository;

        private readonly AssetManagementSystemContext _db;

        public AssetBL(IAssetRepository assetRepository, AssetManagementSystemContext db)
        {
            this._assetRepository = assetRepository;
            this._db = db;
        }

        public ErrorResponse<AssetViewModel> AddAsset(AssetViewModel assetViewModel)
        {
            //Passing from DA to Controller 
            // Converting VM to DA Model
            AssetData assetDataObj = new();

            assetDataObj.BrandId = assetViewModel.BrandId;
            assetDataObj.Assetname = assetViewModel.Assetname;
            assetDataObj.Modelno = assetViewModel.Modelno;
            assetDataObj.Serialno = assetViewModel.Serialno;
            assetDataObj.Quantity = assetViewModel.Quantity;
            assetDataObj.Color = assetViewModel.Color;
            assetDataObj.Size = assetViewModel.Size;
            assetDataObj.Type = assetViewModel.Type;
            assetDataObj.Price = assetViewModel.Price;
            assetDataObj.Imagepath = assetViewModel.Imagepath;

            var result = _assetRepository.AddAsset(assetDataObj);

            //converting DA Object to VM
            ErrorResponse<AssetViewModel> assetModel = new();

            assetModel.Message = result.Message;

            return assetModel;
        }

        public async Task<IEnumerable<Asset>> GetListOfAssets()
        {
            //Passing from DA to Controller
            //IEnumerable <AssetViewModel> res = new AssetViewModel();


            return await _assetRepository.GetListOfAssets();

            //converting DA Object to VM
            //ErrorResponse<IEnumerable<AssetViewModel>> assetModel = new();

            //assetModel.Message = result.Message;
            //assetModel.Data = (IEnumerable<AssetViewModel>)result.Data;

            //return result.
        }
        //public async Task<IEnumerable<AssetViewModel>> GetListOfAssets()
        //{
        //    return await _assetRepository.GetAllProducts();
        //}
        public async Task<IEnumerable<Asset>> GetAssetByAssetName(string AssetName)
        {
            return await _assetRepository.GetAssetByAssetName(AssetName);
        }

        public IEnumerable<SelectListItem> listOfBrands()
        {
            IEnumerable<SelectListItem> listOfBrands = _db.Brands.Select(x =>
              new SelectListItem
              {
                  Text = x.Brandname,
                  Value = x.Id.ToString()
              });

            return listOfBrands;
        }

        //public CheckoutDetails Checkout(CheckoutDetails checkout)
        //{
        //    var result = _assetRepository.Checkout(checkout);
        //    return result;
        //}
        public ErrorResponse<CheckoutDetails> Checkout(CheckoutDetails checkout)
        {
            //Passing from DA to Controller 
            // Converting VM to DA Model
            CheckoutData checkoutData = new();

            checkoutData.Username = checkout.Username;
            checkoutData.Companyname = checkout.Companyname;
            checkoutData.Mobilenumber = checkout.Mobilenumber;
            checkoutData.Address = checkout.Address;
            checkoutData.DateIn = checkout.DateIn;
            checkoutData.DateOut = checkout.DateOut;
            checkoutData.Signature = checkout.Signature;

            var result = _assetRepository.Checkout(checkoutData);

            //converting DA Object to VM
            ErrorResponse<CheckoutDetails> checkModel = new();

            checkModel.Message = result.Message;

            return checkModel;
        }
    }
}
