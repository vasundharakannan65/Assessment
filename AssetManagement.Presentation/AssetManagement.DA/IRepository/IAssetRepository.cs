using AssetManagement.DA.Models;
using AssetManagement.DA.DataObject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetManagement.DA.IRepository
{
    public interface IAssetRepository
    {
        ErrorResponse<AssetData> AddAsset(AssetData assetData);

        Task<IEnumerable<Asset>> GetListOfAssets();

        Task<IEnumerable<Asset>> GetAssetByAssetName(string AssetName);

        ErrorResponse<CheckoutData> Checkout(CheckoutData checkout);
    }
}
