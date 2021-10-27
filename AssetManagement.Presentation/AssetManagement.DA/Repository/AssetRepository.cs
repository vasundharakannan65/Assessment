using AssetManagement.DA.DataObject;
using AssetManagement.DA.IRepository;
using AssetManagement.DA.Models;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetManagement.DA.Repository
{
    public class AssetRepository : IAssetRepository
    {
        private readonly IConfiguration _configuration;

        public AssetRepository(IConfiguration configuration)
        {
            this._configuration = configuration;
        }

        //Adding new asset
        public ErrorResponse<AssetData> AddAsset(AssetData asset)
        {
            //creating object of type Asset to store error message
            ErrorResponse<AssetData> data = new();

            using IDbConnection dbConnection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));

            string sp = "[DBO].[USP_ADDASSET]";

            DynamicParameters parameters = new();

            parameters.Add("BrandId", asset.BrandId);
            parameters.Add("Assetname", asset.Assetname);
            parameters.Add("Modelno", asset.Modelno);
            parameters.Add("Serialno", asset.Serialno);
            parameters.Add("Quantity", asset.Quantity);
            parameters.Add("Color", asset.Color);
            parameters.Add("Size", asset.Size);
            parameters.Add("Type", asset.Type);
            parameters.Add("Price", asset.Price);
            parameters.Add("Imagepath", asset.Imagepath);


            try
            {
                //using dapper adding new asset if exception occurs throws to catch
                SqlMapper.Execute(dbConnection, sp, commandType: CommandType.StoredProcedure, param: parameters);
            }
            catch (Exception e)
            {
                data.Status = 400;
                data.Message = e.Message;
                data.Succeeded = false;
                data.Data = asset;
            }

            return data;

        }

        public ErrorResponse<CheckoutData> Checkout(CheckoutData checkout)
        {
            //creating object of type Asset to store error message
            ErrorResponse<CheckoutData> data = new();

            using IDbConnection dbConnection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));

            string sp = "[dbo].[SP_ASSIGNASSET]";

            DynamicParameters parameters = new();

            parameters.Add("Username", checkout.Username);
            parameters.Add("Address", checkout.Address);
            parameters.Add("Companyname",checkout.Companyname);
            parameters.Add("Mobilenumber", checkout.Mobilenumber);
            parameters.Add("DateIn", checkout.DateIn);
            parameters.Add("DateOut", checkout.DateOut);
            parameters.Add("Signature", checkout.Signature);

            
            try
            {
                //using dapper adding new asset if exception occurs throws to catch
                SqlMapper.Execute(dbConnection, sp, commandType: CommandType.StoredProcedure, param: parameters);
            }
            catch (Exception e)
            {
                data.Status = 400;
                data.Message = e.Message;
                data.Succeeded = false;
                data.Data = checkout;
            }

            return data;
        }
        //Getting List of assets 
        public async Task<IEnumerable<Asset>> GetListOfAssets()
        {
            //creating object of type IEnumerable<Product> to store error message
            ErrorResponse<IEnumerable<Asset>> data = new();

            using IDbConnection dbConnection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));

            string sp = "[dbo].[SP_GETALLASSET]";

            try
            {
                //using dapper getting list of products if exception occurs throws to catch
                return await Task.FromResult(dbConnection.Query<Asset>(sp, commandType: CommandType.StoredProcedure).ToList());

                //ErrorResponse<AssetData> assetData = new();

                //assetData.Data = listOfAssets;

                //data.Data = (IEnumerable<AssetData>)listOfAssets;

            }
            catch (Exception e)
            {
                //assigning error message to error object
                data.Status = 400;

                data.Message = e.Message;

                data.Succeeded = false;

                return data.Data;
            }

        }

        public async Task<IEnumerable<Asset>> GetAssetByAssetName(string AssetName)
        {
            using IDbConnection dbConnection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));

            string sp = "[dbo].[SP_GETAssetbyassetname]";

            DynamicParameters parameters = new();

            parameters.Add("Assetname", AssetName);

            return await Task.FromResult(dbConnection.Query<Asset>(sp, parameters, commandType: CommandType.StoredProcedure).ToList());

        }

    }
}
